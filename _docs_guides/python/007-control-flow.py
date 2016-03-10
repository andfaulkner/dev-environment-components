### IF STATEMENTS ###

x = 5
y = int(raw_input("Please enter an integer: "))

if x + y == 13:
	print 'x plus y is 13!'
elif x + y == 10:
	print 'x plus y is 10!'
else:
	print 'I have no clue what x + y is'


### FOR-IN STATEMENTS ###
dogs = ['meeka', 'callie', 'jake']

for dog in dogs:
	print dog


### NOOP STATEMENT: pass ###
# pass fulfills conditions where a statement is needed syntactically, but no action is required

pass # does nothing

# below makes you wait for keyboard interrupt
while True:
	pass

