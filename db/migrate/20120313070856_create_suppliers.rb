class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :address
      t.string :phone_office
      t.string :mobile_no
      t.string :email

      t.timestamps
    end
  end
end
