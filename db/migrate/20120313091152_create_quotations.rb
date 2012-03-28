class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.integer :item_id
      t.integer :supplier_id
      t.float :rate
      t.date :date

      t.timestamps
    end
  end
end
