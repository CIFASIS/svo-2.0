import matplotlib.pyplot as plt

def plotCorrespondences(a, b, color='r'):
    """Plot correspondences between two sets of 2d points
    
    a, b are 2xN matrices, where a[:, i] corresponds to b[:, i]
    """
    assert a.shape[0] == 2
    assert b.shape[0] == 2
    assert a.shape[1] == b.shape[1]
    for i in range(a.shape[1]):
        plt.plot([a[0, i], b[0, i]], [a[1, i], b[1, i]], c=color)