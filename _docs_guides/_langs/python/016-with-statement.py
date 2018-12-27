#!/usr/bin/env python3

# 'with' is a mechanism to ensure teardown code runs
# Usage: when you have 2 related operations you’d like to execute as a pair,
# with a block of code in between

### SETUP ###
from os import path
cur_file_path = path.realpath(path.dirname(__file__))
test_file_path = path.join(cur_file_path, 'misc', 'test-file.txt')

#----------------------------- USING with-SUPPORTING OBJECTS (COMMON) -----------------------------#
# Opens a file, ensuring close gets called at the end even if it throws
with open(test_file_path) as f:
    print("\nFull file path:", f.name)
    print("\nFile name:", path.basename(f.name))
    print("File content:\n", f.read(), "\n")

#------------------------------ WRITING OWN with-SUPPORTING FUNCTION ------------------------------#
from contextlib import contextmanager

@contextmanager
def log_result(func):
    print(func)
    try:
        print(f"Running function: {func.__name__}")
        res = yield func()
        print(f"Returned from {func.__name__}:", res)
    finally:
        print(f"Done running {func.__name__}\n")

def test_print():
    print("test_print ran")
    return "OK"

with log_result(test_print) as result:
    print("result:", result)

#------------------------------- WRITING OWN with-SUPPORTING OBJECT -------------------------------#
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
    raise Exception("fail")
    print("Doesn't display")

print("Runs if True returned from __exit__")

### OUTPUT ###
# => Entering with block for WithableClass!
# => Meeka
# => Teardown behaviour! Always runs even if a crash occurs in the with block
# => Traceback (most recent call last):
# =>   File "./_docs_guides/_langs/python/016-with-statement.py", line 20, in <module>
# =>     raise Exception("fail")
# => Exception: fail

### Links
# https://preshing.com/20110920/the-python-with-statement-by-example/
# http://effbot.org/zone/python-with-statement.htm
