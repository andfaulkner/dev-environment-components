# --------- CREATE CLASS WITH BASIC CONSTRUCTOR --------- #
class Animal():
    """Doc string for class"""

    # -- Create constructor -- #
    def __init__(self):
        super(Animal, self).__init__()
        print("Animal created!")


# --------- CREATE CLASS WITH SUPERCLASS (INHERIT) --------- #
class Dog(Animal):
    """This is a Dog object"""

    def __init__(self, name, breed, age):
        super(Dog, self).__init__()
        # -- Set property on instance -- #
        self.name = name
        # -- Set multiple properties on instance -- #
        self.breed, self.age = breed, age
        print("Dog", name, "created!")


# ---------------- INSTANTIATE CLASS ---------------- #
meeka = Dog("Meeka", "Rottweiler", 7)
# => Animal created!
# => Dog Meeka created!

# --- Access property on object --- #
print(meeka.name)
# => "Meeka"

print(meeka.breed)
# => "Rottweiler"


# ---------------- STATIC PROPERTIES ---------------- #
# ------- Create class with static property ------- #
class Aardvark:
    """An aardvark animal"""

    num_aardvarks = 0

    def __init__(self):
        print("Created an aardvark!")
        # -- Access static property in the constructor -- #
        Aardvark.num_aardvarks = Aardvark.num_aardvarks + 1


myra = Aardvark()
johnny = Aardvark()

# -- Reference static property -- #
print("Number of aardvarks:", Aardvark.num_aardvarks)
# => Number of aardvarks: 2


# ------- Create class with static method ------- #
class Alpaca:
    """An alpaca animal"""

    num_alpacas = 0

    def __init__(self):
        print("Created an alpaca!")
        Alpaca.num_alpacas = Alpaca.num_alpacas + 1

    @staticmethod
    def herd_noise():
        for x in range(0, Alpaca.num_alpacas):
            print("YEEEEEUUUUU!")


carl = Alpaca()
jack = Alpaca()
jodie = Alpaca()

# -- Call static method -- #
Alpaca.herd_noise()
# => YEEEEEUUUUU!
# => YEEEEEUUUUU!
# => YEEEEEUUUUU!
