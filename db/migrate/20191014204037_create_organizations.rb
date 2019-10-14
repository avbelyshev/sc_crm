class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :legal_form, null: false
      t.string :inn, null: false
      t.string :ogrn, null: false

      t.timestamps
    end
  end
end
