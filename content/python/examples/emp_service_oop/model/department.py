class department:
    def __init__(self, name, location):
        self.name = name
        self.location = location
    def __str__(self):
        return "Department(name={}, location={})".format(self.name, self.location)
