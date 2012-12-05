class Property < ActiveRecord::Base
  attr_accessible :name, :value

  has_many :property_assignments
  has_many :products, through: :property_assignments
end
