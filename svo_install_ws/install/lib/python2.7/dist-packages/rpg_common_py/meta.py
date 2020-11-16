def members(object):
    """ Gets member variables of an object:
    https://stackoverflow.com/questions/1398022/looping-over-all-member-variables-of-a-class-in-python
    """
    return [attr for attr in dir(object) if not callable(getattr(object, attr))
    and not attr.startswith("__")]
