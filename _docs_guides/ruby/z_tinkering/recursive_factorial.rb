def factorial (num)
	((num == 0) ? 1 : ((num == 1) ? 1 : factorial(num-1)) * num)
end