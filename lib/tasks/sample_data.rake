require 'rubygems'
require 'roo'
HOURLY_RATE = 123.45
namespace :db do
  desc "Fill database with simple data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_items
    make_suppliers
  end
end
def make_items   
    oo = Openoffice.new("/home/personal/Documents/sheet1.ods")
    oo.default_sheet = oo.sheets.first
    3.upto(oo.last_row) do |line|
    code         = oo.cell(line,'A')
    itemname     = oo.cell(line,'B')
    manufacturer = oo.cell(line,'C')
    unit         = oo.cell(line,'D')
    description  = oo.cell(line,'E')
    category_name = oo.cell(line,'F')
    category = Category.create!(:name => category_name)
    if category
      item = Item.create!(:code => code,
                   :itemname => itemname,
                   :manufacturer => manufacturer,
                   :unit =>unit,
                   :description => description,
                   :category_id => category.id)
    end
    if item
      puts "#{code}\t#{itemname}\t#{manufacturer}\t#{unit}\t#{category}"
    end
  end
end
 def make_suppliers
    oo = Openoffice.new("/home/personal/Documents/sheet2.ods")
    oo.default_sheet = oo.sheets.first
    3.upto(oo.last_row) do |line|
    name         = oo.cell(line,'A')
    address      = oo.cell(line,'B')
    office_phone = oo.cell(line,'C')
    mobile_no    = oo.cell(line,'D')
    email        = oo.cell(line,'E')
      supplier = Supplier.create!(:name => name,
                   :address => address,
                   :phone_office => office_phone,
                   :mobile_no =>mobile_no,
                   :email => email)
    if supplier
      puts "#{name}\t#{address}\t#{office_phone}\t#{mobile_no}\t#{email}"
    end
   end
 end