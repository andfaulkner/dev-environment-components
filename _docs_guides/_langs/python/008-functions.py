#!/usr/bin/env python3

#*************************************** DEFINING FUNCTIONS ***************************************#
def addthree(n):
	return n + 3

x = int(input("Please enter an integer: "))

print(addthree(x))
# If 7 entered:
#   => 10

# this is OK too:
# 		print addthree(int(raw_input("Please enter an integer: ")))

#*************************************** DEFAULT ARGUMENTS ****************************************#
def addfive(n=3):
	return n + 5

def hello(name):
  print("hello " + name + "!")

#********************************** VARIABLE NUMBER OF ARGUMENTS **********************************#
def hello_all(*argv):
    for arg in argv:
        print("Hello", arg)

hello_all("Meeka", "Callie", "Logan")
# => Hello Meeka
# => Hello Callie
# => Hello Logan
