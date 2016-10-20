### DICTIONARIES ###
# aka dicts

# Very similar to JS objects
#   Key difference: any value can be paired with any value.
#   The keys do not need to be strings.

############### CREATE A DICT ###############
test_dict = { "asdf": "okokok" }

test_dict_2 = { 3: 234 }

animals_dict = {
  "meeka": {
    "type": "dog",
    "age": 5
  },
  "kyra": {
    "type": "cat",
    "age": 13,
    "hobbies": "being a pain in the ass"
  }
}

############### GET A VALUE FROM A DICT ###############
print(test_dict["asdf"])
# => 'asdf'

print(test_dict[3])
# => 234

print(animals_dict["meeka"]["type"])
# => 'dog'

print(animals_dict["meeka"])
# => {'age': 5, 'type': 'dog'}

################# ADD AN ITEM TO A DICT ####################
animals_dict["coffee"] = { "type": "cat", "age": 8 }

print(animals_dict)
# => {'coffee': {'age': 8, 'type': 'cat'}, 'kyra': {'age': 13, 'type': 'cat', 'hobbies': 'being a pain in the ass'}, 'meeka': {'age': 5, 'type': 'dog'}}

################# REMOVE AN ITEM FROM A DICT ####################
animals_dict.__delitem__("coffee")

print(animals_dict)
# => {'kyra': {'age': 13, 'type': 'cat', 'hobbies': 'being a pain in the ass'}, 'meeka': {'age': 5, 'type': 'dog'}}

################ LIST THE VALUES (but not the keys) OF A DICT ##################
print(animals_dict.values())
# => dict_values([{'age': 13, 'type': 'cat', 'hobbies': 'being a pain in the ass'}, {'age': 5, 'type': 'dog'}])

# Note that using dict_values requires special manipulations - this does not return an array
#   The return type is in fact "dict_values"
