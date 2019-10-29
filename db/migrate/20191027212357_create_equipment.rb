class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :kind
      t.string :serial_number
      t.references :organization

      t.timestamps
    end
  end
end
