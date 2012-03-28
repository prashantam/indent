class Supplier < ActiveRecord::Base
	has_many :stockists,:dependent => :destroy
    has_many :items, :through => :stockists
    has_many :quotations, :dependent => :destroy
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :name, :presence => true
	validates :address, :presence => true
	validates :phone_office, :presence => true
	validates :mobile_no, :presence => true
	validates :email, :presence =>true,
            :format=>{:with => email_regex},
            :uniqueness => true
end
