class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :itemname
      t.string :manufacturer
      t.float :unit
      t.string :description
      t.integer :category_id
      t.timestamps
    end
  end
end
