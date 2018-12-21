#!/usr/bin/env python3

from os import path

cur_file_path = path.realpath(path.dirname(__file__))
print("Current directory path:", cur_file_path)

test_file_path = path.join(cur_file_path, 'misc', 'test-file.txt')
print("Test file path:", test_file_path)

# 'with' is a mechanism to ensure teardown code runs

#--------------------------------- USAGE WITH SUPPORTING OBJECTS ----------------------------------#
with open(test_file_path) as f:
    print("\nFull file path:", f.name)
    print("\nFile name:", path.basename(f.name))
    print("File content:\n", f.read(), "\n")

#--------------------------------- WRITING OWN with-USING OBJECT ----------------------------------#
class WithableClass():
    """Class where 'with' works"""

    def __init__(self, name):
        self.name = name

    # Runs at start of with block
    def __enter__(self):
        print("Entering with block for WithableClass!")
        return self

    # Runs even if content of 'with' block raised an exception
    # To run clean-up code
    def __exit__(self, type, value, traceback):
        print("Teardown behaviour! Always runs even if a crash occurs in the with block")
        return False

with WithableClass("Meeka") as example:
    print(example.name)
    print("Goodbye")

print("Would run if True returned from __exit__")

### OUTPUT ###
# => Entering with block for WithableClass!
# => Meeka
# => Teardown behaviour! Always runs even if a crash occurs in the with block
# => Traceback (most recent call last):
# =>   File "./_docs_guides/_langs/python/016-with-statement.py", line 20, in <module>
# =>     raise Exception("fail")
# => Exception: fail

### Links
# http://effbot.org/zone/python-with-statement.htm