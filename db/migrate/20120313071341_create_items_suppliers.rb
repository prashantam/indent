class CreateItemsSuppliers < ActiveRecord::Migration
  def change
    create_table :items_suppliers do |t|
      t.integer :item_id
      t.integer :supplier_id

      t.timestamps
    end
    add_index :itemsSuppliers, :item_id
    add_index :itemsSuppliers, :supplier_id
    add_index :itemsSuppliers, [:item_id, :supplier_id], :unique => true
  end
end
