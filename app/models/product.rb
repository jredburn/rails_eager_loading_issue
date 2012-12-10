class Product < ActiveRecord::Base
  class << self; attr_accessor :name_property, :external_id_property end
  @name_property = "Name"
  @external_id_property = "ExternalID"


  has_many :property_assignments
  has_many :property_assignments_v, :class_name => 'PropertyAssignment'
  has_many :property_assignments_e, :class_name => 'PropertyAssignment'

  has_many :properties, through: :property_assignments

  has_many :name_values, through: :property_assignments_v,
                         source: :property,
                         conditions: proc { ["properties.name = ?", Product.name_property] }

  has_many :external_id_values, through: :property_assignments_e,
                                source: :property,
                                conditions: proc { ["properties.name = ?", Product.external_id_property] }

  def name
    name_values.first.present? ? name_values.first.value : nil
  end

  def external_id
    external_id_values.first.present? ? external_id_values.first.value : nil
  end

end
