Types of associations
=====================

##one-to-one
*   exists when one item has exactly one of another item. e.g.:
		*   a person has exactly 1 birthday
		*

##one-to-many
*   exists when a single object can be a member of many other objects. e.g.:
		*   one course can have many books

##many-to-many
*   when the first object is related to 1 or more of a second object, & the second
		object is related to one or many of the first object. e.g.:
			*   one course has many students	 AND	 one student has many courses

Methods on ActiveRecord::Base
=============================
##through:
*   specifies a join model through which to perform the query
*   'has_many :through' associations provide a way to implement many-to-many relationships

##has_many :through
*   example:
			  has_many :patients, through: :appointments

*   alternative: has_and_belongs_to_many
		*   use has_many :through instead if you need validations, callbacks, or extra attributes
				on the join model

##has_and_belongs_to_many
				has_and_belongs_to_many :somethings
						*   where somethings can be any other model (e.g. courses)

has_one :something
*

accepts_nested_attributes_for
*   model property.
*   lets you specify that a model will be able to also accept attributes for some of its
		relational models as setup through the has_many associations
*   example use:

				class Quantity < ActiveRecord::Base
				  attr_accessible :amount,
				                  :ingredient,
				                  :ingredient_attributes
				  belongs_to :recipe
				  belongs_to :ingredient
				  accepts_nested_attributes_for :ingredient,
				                                :reject_if => :all_blank
				end
