class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"


	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda {where(:visible => false)}
	scope :sorted, lambda {order("pages.position ASC")}
	scope :newest_first, lambda {order("pages.created_at DESC")}
	# The scope below is an example of a scope with parameters, here the where method
	# accepted an array instead of just a single data, the syntax shown is SQL
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
