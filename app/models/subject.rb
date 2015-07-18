class Subject < ActiveRecord::Base

	has_many :pages

	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda {where(:visible => false)}
	scope :sorted, lambda {order("subjects.position ASC")}
	scope :newest_first, lambda {order("subjects.created_at DESC")}
	# The scope below is an example of a scope with parameters, here the where method
	# accepted an array instead of just a single data, the syntax shown is SQL
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
