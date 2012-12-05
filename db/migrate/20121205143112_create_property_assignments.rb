class CreatePropertyAssignments < ActiveRecord::Migration
  def change
    create_table :property_assignments do |t|

      t.timestamps
    end
  end
end
