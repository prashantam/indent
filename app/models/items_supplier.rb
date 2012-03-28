class ItemsSupplier < ActiveRecord::Base
	belongs_to :item_id, :class_name => "Item"
	belongs_to :supplier_id, :class_name => "Supplier"

	validates :item_id, :presence => true
	validates :supplier_id, :presence => true
end
