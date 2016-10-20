# CHECKING A VALUE'S TYPE

#### GET THE TYPE OF A VALUE ####
type(4)
# => <class 'int'>

#### MAKE TYPE COMPARISONS BASED ON RETURNED TYPE ####
print(type(4) is int)
# => True

print(type("WIN!") is str)
# => True

print(type(42.42) is float)
# => True

print(type([]) is list)
# => True

print(type(["adf", "werewe"]) is list)
# => True

print(type({}) is dict)
# => True

print(type({'asdf': 'oooo'}) is dict)
# => True
