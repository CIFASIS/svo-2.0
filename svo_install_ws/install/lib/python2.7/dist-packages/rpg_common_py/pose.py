import numpy as np
import scipy.linalg

def cross2Matrix(v):
    return np.array([[0, -v[2], v[1]],
                     [v[2], 0, -v[0]],
                     [-v[1], v[0], 0]])

def matrix2Cross(M):
    skew = (M - M.T)/2
    return np.array([-skew[1, 2], skew[0, 2], -skew[0, 1]])

class Pose(object):
    def __init__(self, R, t):
        # Cannot be matrix or anything else, else chaos
        assert type(R) is np.ndarray
        assert type(t) is np.ndarray
        # For now, 2D could also be possible, but we need the following for
        # proper broadcasting in the transformation:
        assert t.shape[1] == 1
        self.R = R
        self.t = t

    def inverse(self):
        return Pose(self.R.T, -np.dot(self.R.T, self.t))

    def __mul__(self, other):
        # If the right operand is a pose, return the chained poses.
        if isinstance(other, Pose):
            return Pose(np.dot(self.R, other.R), np.dot(self.R, other.t) + self.t)
        # If it is a vector or several vectors expressed as matrix, apply the
        # pose transformation to them.
        if type(other) is np.ndarray or\
        type(other) is np.matrixlib.defmatrix.matrix:
            return np.dot(self.R, other) + self.t

        raise Exception('Multiplication with unknown type!')

    def asArray(self):
        return np.vstack((np.hstack((self.R, self.t)), np.array([0,0,0,1])))

    def asTwist(self):
        so_matrix = scipy.linalg.logm(self.R)
        if np.sum(np.imag(so_matrix)) > 1e-10:
            raise Exception('logm called for a matrix with angle Pi. ' +
                'Not defined! Consider using another representation!')
        so_matrix = np.real(so_matrix)
        return np.hstack((np.ravel(self.t), matrix2Cross(so_matrix)))

def fromMatrix(M):
    return Pose(M[:3, :3], M[:3, 3].reshape(3, 1))

def fromTwist(twist):
    # Using Rodrigues' formula
    w = twist[3:]
    theta = np.linalg.norm(w)
    if theta < 1e-6:
        return Pose(np.eye(3), twist[:3].reshape(3, 1))
    M = cross2Matrix(w/theta)
    R = np.eye(3) + M * np.sin(theta) + np.dot(M, M) * (1 - np.cos(theta))
    return Pose(R, twist[:3].reshape(3, 1))

def cosSinDeg(angle_deg):
    return np.cos(np.radians(angle_deg)), np.sin(np.radians(angle_deg))

def xRotationDeg(angle_deg):
    c, s = cosSinDeg(angle_deg)
    R = np.array([[1, 0, 0],
                  [0, c, -s],
                  [0, s, c]])
    return Pose(R, np.zeros((3, 1)))

def yRotationDeg(angle_deg):
    c, s = cosSinDeg(angle_deg)
    R = np.array([[c, 0, s],
                  [0, 1, 0],
                  [-s, 0, c]])
    return Pose(R, np.zeros((3, 1)))

def zRotationDeg(angle_deg):
    c, s = cosSinDeg(angle_deg)
    R = np.array([[c, -s, 0],
                  [s, c, 0],
                  [0, 0, 1]])
    return Pose(R, np.zeros((3, 1)))

def rollPitchYawDeg(r, p, y):
    return xRotationDeg(r) * yRotationDeg(p) * zRotationDeg(y)
