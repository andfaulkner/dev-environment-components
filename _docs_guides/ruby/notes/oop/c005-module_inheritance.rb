#!/usr/local/bin/ruby

# 
# Modules: 		allow you to group constants and methods together logically into groups
# 				 		called namespaces, groups which organize modules and the like in such a 
# 						way as to avoid ambiguity and promote logical organization of code.
# 
# Namespaces: allow you to write larger groups of reusable code without the danger of
# 						stomping on other code outside of the namespace.
# 						
# include:    mixes a module into a class, or into another module
# 						If two modules define the same method, then the last one to be included wins.
# 						If a module is included X2, the 2nd inclusion is ignored, so it's still further back
# 						on the lookup chain than any module included after the 1st inclusion of the module
# 

REQ_PERMS_MSG = "Requesting File Permissions..."


puts "------------------------------------------------------------------------------------------"
########################################################################
#                    CLASS INHERITING FROM A MODULE                    #
########################################################################
puts "***************** CLASS INHERITING FROM A MODULE *****************"
puts " ----- DEFINE MODULE TO BE INHERITED FROM -----"
module FilePermissionConstants
	READABLE_FLAG = "r"
	WRITABLE_FLAG = "w"
	EXECUTABLE_FLAG = "e"
	def flags_array
		"#{READABLE_FLAG}#{WRITABLE_FLAG}#{EXECUTABLE_FLAG}"
	end
end

puts " ----- DEFINE CLASS THAT INHERITS FROM MODULE -----"
class FilePermissions
	include FilePermissionConstants
	attr_reader :file, :fstat

	def initialize(filename)
		@file = File.open(filename)
		@fstat = @file.stat
	end
	def get_own_permissions_string
		readable_string = @fstat.readable? ? READABLE_FLAG : "-"
		writable_string = @fstat.writable? ? WRITABLE_FLAG : "-"
		executable_string = @fstat.executable? ? EXECUTABLE_FLAG : "-"
		"#{readable_string}#{writable_string}#{executable_string}"
	end
	def get_world_permissions_string
		readable_string = @fstat.world_readable? ? READABLE_FLAG : "-"
		writable_string = @fstat.world_writable? ? WRITABLE_FLAG : "-"
		# executable_string = @file.executable? ? EXECUTABLE_FLAG : "-"
		"#{readable_string}#{writable_string}?"
	end
	def get_unix_permissions_string
		puts REQ_PERMS_MSG # => Requesting File Permissions...	 <<< classes can call outside constants
		"#{get_own_permissions_string} ??? #{get_world_permissions_string}"
	end
	def self.req_file_perms # defined as a class variable
		REQ_PERMS_MSG 
	end
end

puts " ----- INSTANTIATE CLASS THAT INHERITS FROM MODULE -----"
test_file = FilePermissions.new("./test_file.txt")

puts " ----- RUN CLASS INSTANCE METHOD THAT USES A CONSTANT FROM THE PARENT MODULE -----"
puts test_file.get_own_permissions_string 		# => rw-

puts " ----- RUN CLASS INSTANCE METHOD THAT USES A CONSTANT FROM THE OUTSIDE -----"
puts test_file.get_unix_permissions_string 		# => rw- ??? r-?

puts " ----- DIRECTLY CALL MODULE CONSTANT BY REQUESTING FROM INSTANCE OF INHERITING CLASS -----"
puts test_file.class::READABLE_FLAG 					# => r

puts " ----- TRY TO CALL MODULE CONSTANT FROM OUTSIDE BY NAME ALONE, NO NAMESPACE (CAN'T DO IT)"
# puts READABLE_FLAG # => uninitialized constant READABLE_FLAG (NameError)

puts " ----- CALL MODULE CONSTANT FROM OUTSIDE VIA THE MODULE-INHERITING CLASS"
puts FilePermissions::WRITABLE_FLAG 					# => w

# you would never do this - just making a point regarding scoping
puts " ----- CALL OUTSIDE CONSTANT FROM CLASS METHOD (key: uninstantiated class method) -----"
puts FilePermissions::req_file_perms					# => Requesting File Permissions...


puts "------------------------------------------------------------------------------------------"
###############################################################################
#                    MODULE INHERITING FROM ANOTHER MODULE                    #
###############################################################################
puts "***************** MODULE INHERITING FROM ANOTHER MODULE *****************"

module Legged
	HAS_LEGS = true
	def self.move_leg
		puts "I'm a movin' a leg!"
	end
	def self.mosey
		puts "I'm moseyin' along, mosey mosey mosey"
	end
end

module Bipedal
	include Legged
	LEGS = 2
	def walk_upright
		puts "I'm a walkin on two legs! Wat wat!"
	end
	def self.move_two_legs
		Legged::move_leg
		Legged.move_leg
	end
	def self.do_i_have_legs
		puts HAS_LEGS ? "I have legs!" : "I have no legs" # calls parent module constant
	end
end

puts " ----- CALL MODULE FUNCTION FROM GLOBAL...REDUX -----"
Legged::mosey

# OUTSIDE calls CHILD requesting it run method from PARENT    <<<<< can't do it.
puts " ----- FROM OUTSIDE, CALL MODULE FN, WHERE MODULE INHERITED FN FROM PARENT (YOU CAN'T) -----"
# Bipedal::mosey # => undefined method `mosey' for Bipedal:Module (NoMethodError)

# CHILD --[request to run exported module function]--> PARENT
puts " ----- FROM OUTSIDE, CALL CHILD MODULE FUNCTION THAT CALLS PARENT MODULE FUNCTION -----"
Bipedal::move_two_legs

puts "------------------------------------------------------------------------------------------"

# OUTSIDE --[asks for constant]--> CHILD --[gets constant from]--> PARENT
puts " ----- FROM OUTSIDE, CALL CHILD MODULE TO GET PARENT MODULE CONSTANT-----"
puts Bipedal::HAS_LEGS # => true

# OUTSIDE --[req 2 run module fn]--> CHILD --[gets constant from]--> PARENT
puts " ----- CALL CHILD MODULE FUNCTION THAT USES PARENT MODULE CONSTANT -----"
Bipedal::do_i_have_legs # => I have legs!


puts "------------------------------------------------------------------------------------------"
#########################################################
#                    MODULE METADATA                    #
#########################################################
puts "***************** MODULE METADATA *****************"

puts " ----- GET LIST OF ALL MODULES A MODULE INHERITS FROM -----"
puts Bipedal.ancestors.to_s # => [Bipedal, Legged]


puts "------------------------------------------------------------------------------------------"
###############################################################################
#                    MODULE FUNCTION INHERITANCE EXPLAINED                    #
###############################################################################
# 
# When a module (mod) inherits from another module, methods in the parent module can't 
# be called from outside
# 
# M-inh: module-inheriting
# 
# What functions (fn) each namespace (ns) can see:
#   
#   fn categories   |NSes~~>| Outside | Child mod | Parent mod | M-inh class | M-inh class instance
#   ======\/===============++=========+===========+============+=============+=====================
# 	Global fns             || VISIBLE |           |            |             |
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Child module fns       || VISIBLE |  VISIBLE  |            |             |
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Child non-module fns   ||         |  VISIBLE  |            |             |
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Parent module fns      ||         |  VISIBLE  |  VISIBLE   |             |
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Parent non-module fns  ||         |           |  VISIBLE   |             |
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Outside constants      || VISIBLE |           |            |   VISIBLE   |        VISIBLE
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Child module constants || VISIBLE |  VISIBLE  |            |   VISIBLE   |        VISIBLE
# 	-----------------------++---------+-----------+------------+-------------+---------------------
# 	Parent module constants|| VISIBLE |  VISIBLE  |  VISIBLE   |   VISIBLE   |        VISIBLE
# 	-----------------------++---------+-----------+------------+-------------+---------------------


# module Mammal
# 	FURRY = true
# 	SEXES = ["male", "female"]
# 	class 
# end

# module Amphibian


# class DuckbilledPlatypus
# 	include Mammal
# 	include Amphibian