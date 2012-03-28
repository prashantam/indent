class CreateStockists < ActiveRecord::Migration
  def change
    create_table :stockists do |t|
      t.integer :item_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
