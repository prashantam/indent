class Quotation < ActiveRecord::Base
belongs_to :items
belongs_to :supplier
validates :item_id, :presence => true
validates :rate, :presence => true
validates :supplier_id, :presence => true
validates_uniqueness_of :item_id, :scope => [:supplier_id]

default_scope :order => 'quotations.created_at DESC'
end
