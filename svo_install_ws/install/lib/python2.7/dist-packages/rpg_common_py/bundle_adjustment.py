import copy
import numpy as np
import scipy.optimize

from rpg_common_py import pose

def rms(x):
    return np.sqrt(np.mean(np.square(x)))

def project(p_W, T_W_C, K):
    p_C = T_W_C.inverse() * p_W
    points = np.dot(K, p_C)
    return points[:2, :] / points[2, :]

class TwoFrameBA(object):
    """ Optimizes for landmarks (3D) and 6-DOF poses, not scale; can drift in
    scale! Intended for 8-point refinement. """
    def __init__(self, image_points, K):
        self.image_points = image_points
        self.K = K
        self.atan_loss = 0.0

    def useAtanLoss(self, tolerance):
        """ If called, BA will use atan as robust loss function with the
        indicated tolerance. The tolerance is where the loss function starts
        to become significantly flat. """
        self.atan_loss = tolerance

    def project(self, p_W, T_W_C):
        # This is called very often, so shedding func. calls to optimize.
        # Inverse parametrization seems to provide faster convergence!
        R_C_W = T_W_C.R.T
        t_C_W = -np.dot(R_C_W, T_W_C.t)
        p_C = np.dot(R_C_W, p_W) + t_C_W
        points = np.dot(self.K, p_C)
        return points[:2, :] / points[2, :]

    def errorFunction(self, hidden_state):
        T_W_C, p_W = self.unpackState(hidden_state)
        # Shedding the project call does not seem to optimize
        diffs0 = self.image_points[0] - self.project(p_W, T_W_C[0])
        diffs1 = self.image_points[1] - self.project(p_W, T_W_C[1])
        error = np.concatenate([np.ravel(diffs0), np.ravel(diffs1)])
        if self.atan_loss > 0.0:
            return np.arctan(error / self.atan_loss * 3)
        else:
            return error

    def packState(self, T_W_C, p_W):
        return np.hstack((T_W_C[0].asTwist(), T_W_C[1].asTwist(),
            np.ravel(p_W.T)))

    def unpackState(self, state):
        T_W_C = [pose.fromTwist(state[0:6]),
                 pose.fromTwist(state[6:12])]
        p_W = np.reshape(state[12:], (-1, 3)).T
        return T_W_C, p_W

    def run(self, T_W_C_in, p_W_in, maxfev=None):
        hidden_state = self.packState(T_W_C_in, p_W_in)
        full_initial_error = self.errorFunction(hidden_state)
        err0 = rms(full_initial_error)
        if full_initial_error.size < hidden_state.size:
            raise Exception(
                    'Error dimension (' + str(full_initial_error.size) +\
                    ') must be at least same as state dimension (' +\
                    str(hidden_state.size) + ')!')
        if maxfev is not None:
            res = scipy.optimize.leastsq(
                self.errorFunction, hidden_state, maxfev=maxfev)
        else:
            res = scipy.optimize.leastsq(
                self.errorFunction, hidden_state)
        errend = rms(self.errorFunction(res[0]))
        T_W_C_opt, p_W_opt = self.unpackState(res[0])
        return T_W_C_opt, p_W_opt, err0, errend
