# You must often explicitly cast to change a value's type

############ CASTING STRINGS TO NUMBERS ############

"4" + "5"
# => '45'

int("4") + int("5")
# => 9

float("5.4")
# => 5.4

int("5.4")
# => ERROR - type int cannot have a decimal


############ CASTING NUMBERS TO STRINGS ############

4
# => 4

str(4)
# => '4'

str(5.4)
# => '5.4'


############ CASTING BETWEEN NUMBER TYPES ############

int(4.5)
# => 4

float(7)
# => 7.0


############ CASTING FROM BOOLEAN <--> STRING ############

bool("true")
# => True

str(True)
# => 'True'
