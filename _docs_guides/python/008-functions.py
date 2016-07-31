def addthree(n):
	return n + 3

x = int(raw_input("Please enter an integer: "))

print addthree(x)

# this is OK too:
# 		print addthree(int(raw_input("Please enter an integer: ")))


### DEFAULT ARGUMENTS ###

def addfive(n=3):
	return n + 5

def hello(name):
  print("hello " + name + "!")
