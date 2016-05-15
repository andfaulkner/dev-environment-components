#!/usr/bin/env ruby

# seriously, always compose

# make variables given to initialize automatically bind to the instance, no @arg = arg
require 'forwardable'

class User
	attr_reader :account

	extend Forwardable 		# NOT INCLUDE!!!!

	def_delegators :account, :first_name, :last_name, :email

	def initialize(account)
		@account = account
	end

	def full_name
		"#{first_name} #{last_name} is the user's name!"
	end

end

GithubAccount = Struct.new(:login, :email, :first_name, :last_name)
FacebookAccount = Struct.new(:uid, :email, :first_name, :last_name)

mememe = User.new(GithubAccount.new("andfaulkner", "hmiwonderwho@gmail.com", "andrew", "faulkner"))
puts mememe.full_name # => andrew faulkner is the user's name!
puts mememe.email



puts "------------------------------------------------------------------------------------------"
####################################################################
#          MAKE STRUCT GIVEN TO FORWARDABLE CLASS PRIVATE          #
####################################################################
puts "***************** MAKE STRUCT GIVEN TO FORWARDABLE CLASS PRIVATE *****************"

class UserTwo

	extend Forwardable

	def_delegators :@account, :first_name, :last_name, :email 

	def initialize(account)
		@account = account
	end

	def full_name
		"#{first_name} #{last_name} is the user's name!"
	end

end

meeka = UserTwo.new(FacebookAccount.new("meekameeks", "meekameeks@gmail.com", "meeka", "faulkner"))
puts meeka.full_name # => meeka faulkner is the user's name!
