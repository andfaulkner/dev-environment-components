#
# 	Center a string
# 	@str {String} String to center
# 	@pad {FixNum} Amount of padding to apply in total
# 								E.g. a 4 letter word w/ pad=6 will have 1 space on each side.
# 										 a 4 letter word w/ pad=7 will have 1 space on the left, 2 on the right
#
def center(str, pad)
	if p (pad - str.size).even?
		rpad = lpad = (pad - str.size)/2
	else
		lpad = ((pad - 1) - str.size) / 2
		rpad = (((pad - 1)  - str.size) / 2) + 1
	end
	str.ljust(str.size + lpad).rjust(str.size + lpad + rpad)
end

p center('asdf', 8)


