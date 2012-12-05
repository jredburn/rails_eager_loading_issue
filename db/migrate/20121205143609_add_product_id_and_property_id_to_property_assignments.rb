class AddProductIdAndPropertyIdToPropertyAssignments < ActiveRecord::Migration
  def change
    add_column :property_assignments, :product_id, :integer
    add_column :property_assignments, :property_id, :integer
  end
end
