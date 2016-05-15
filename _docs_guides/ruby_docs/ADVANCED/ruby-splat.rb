require 'pry'

# useless, besides safety purposes
def dothings(*)
	puts "things are done!"
	puts "call me with as many args as you want!"
end

dothings("ok", "you are wasting your time", "I do nothing")



def displaya(*display_all)
	display_all.each{|item| puts item }
end

displaya("hello", "everyone", "display", "all", "the", "things!")
# =>  hello
# =>  everyone
# =>  display
# =>  all
# =>  the
# =>  things!

def receiver_of_args(*args)
	args.each{|arg| puts arg}
end

def pass_along(*args)
	receiver_of_args(*args) # passes along all args, however many
end

pass_along("--------------------", "another", "accepter", "of", "many", "things")
# =>  --------------------
# =>  another
# =>  accepter
# =>  of
# =>  many
# =>  things
