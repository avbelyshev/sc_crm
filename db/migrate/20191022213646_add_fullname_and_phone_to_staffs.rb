class AddFullnameAndPhoneToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :fullname, :string
    add_column :staffs, :phone, :string
  end
end
