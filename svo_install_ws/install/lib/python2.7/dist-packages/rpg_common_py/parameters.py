import pickle

import rpg_common_py.meta as meta

class Parameters:
    """
    Save your experiment parameters as attributes of an instance of this class.
    Then, you can conveniently save parameter-depending results as an
    automatically-named pickle.
    """

    def getString(self):
        """

        """
        members = meta.members(self)
        return '_'.join([attr + '=' + str(getattr(self, attr))
                         for attr in members])

    def dirString(self):
        return self.getString().replace('/', '_')

    def pickle(self, obj, prefix=''):
        with open(prefix + self.dirString() + '.pickle', 'wb') as f:
            pickle.dump(obj, f)

    def loadPickle(self, prefix=''):
        with open(prefix + self.dirString() + '.pickle', 'rb') as f:
            return pickle.load(f)

    def study(self, attr, values, experiment):
        """
        the attribute 'attr' is set to each value of the list 'values',
        respectively, and self is passed to the callable 'experiment'.
        Returns a list containing the return values of 'experiment'.
        As the name suggests, this can be used for parameter studies.
        The attribute is reset to its original value afterwards.
        """
        nominal_value = getattr(self, attr)
        results = []
        for value in values:
            setattr(self, attr, value)
            results.append(experiment(self))
        setattr(self, attr, nominal_value)
        return results
