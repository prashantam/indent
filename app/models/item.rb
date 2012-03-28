class Item < ActiveRecord::Base
belongs_to :category

has_many :stockists,:dependent => :destroy
has_many :suppliers, :through => :stockists

has_many :quotations , :dependent => :destroy
validates :code, :presence => true
validates :itemname, :presence => true
validates :manufacturer, :presence => true
validates :unit, :presence => true
validates :description, :presence => true
end
