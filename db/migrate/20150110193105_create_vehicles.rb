class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.integer :manufacturer_id, null: false
      t.string :description

      t.timestamps
    end
  end
end
