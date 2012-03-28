class Stockist < ActiveRecord::Base
	belongs_to :item
	belongs_to :supplier
    #validates_acceptance_of :supplier_ids,:message => "select atleast one"
end