class StockistsController < ApplicationController
	before_filter :get_item_and_suppliers, :only => [:new]

	def get_item_and_suppliers
		  if params[:item_id].nil?
		  get_stockist_and_item
		else
	    @item = Item.find(params[:item_id])
	    @current_suppliers = @item.suppliers
	    @suppliers = Supplier.all
	  end
	end

	def get_stockist_and_item
		  @supplier = Supplier.find(params[:supplier_id])
      @current_items = @supplier.items
      @items = Item.all
	end

	def index
	    @stockists = Stockist.all
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @stockists }
	    end
  	end

  # GET /Stockists/1
  # GET /Stockists/1.json
	  def show
      @supplier = Supplier.find(params[:supplier_id])
      @stockist = Stockist.new
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @stockist }
	    end
	  end

  # GET /Stockists/new
  # GET /Stockists/new.json
	  def new
	    @stockist = Stockist.new
	      respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @stockist }
	    end
	  end

  # GET /Stockists/1/edit
	  def edit
	    @stockist = Stockist.find(params[:id])
	    @category = Category.all
	  end

	def create
		if params[:supplier_ids].nil?
		active_item_ids = params[:item_ids]
	    active_item_ids.each do |item_id|
        @stockist = Stockist.create!(:item_id => item_id,:supplier_id => params[:supplier_id])
        end			
	    else
	    active_suplier_ids = params[:supplier_ids]
		active_suplier_ids.each do |sid|
        @stockist = Stockist.create!(:item_id => params[:item_id],:supplier_id => sid)
        end
        end
	      if @stockist.save
          redirect_to request.referer
           end
	        
	end

	
  	def destroy
  	  if params[:delete_supplier_ids].nil?
  		active_item_ids = params[:delete_item_ids]
		active_item_ids.each do |item_id|
        @stockist = Stockist.find(:all,:conditions =>["item_id=? and supplier_id=?",item_id,params[:supplier_id]])
        Stockist.destroy(@stockist)
        end
        else	
  		active_suplier_ids = params[:delete_supplier_ids]
		active_suplier_ids.each do |sid|
        @stockist = Stockist.find(:all,:conditions =>["item_id=? and supplier_id=?",params[:item_id],sid])
        Stockist.destroy(@stockist)
        end
      end
  		#@stockist = Stockist.find(params[:id])
  		#@supplier = Supplier.find(params[:supplier_id])
  		#@item = Item.find(params [:item_id])
  		#@item.stockists.destroy()
	    #@stockist.destroy
        redirect_to request.referer
 	end

 	def update
	    @stockist = Stockist.find(params[:id])

	    respond_to do |format|
	      if @stockist.update_attributes(params[:item])
	        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @stockist.errors, status: :unprocessable_entity }
	      end
	    end
	end
 end