class ProductsController < ApplicationController
  
  def index
  	if params[:category_id].present?
  		category = Category.find_by(id: params[:category_id])
  		@products = category.products.paginate(page: params[:page], per_page: 6)
  	else
  		@products = Product.paginate(page: params[:page], per_page: 6)
  	end
  	@categories = Category.all
  end

  def show
  	@product = Product.find_by(id: params[:id])
    @order_item = current_order.order_items.new
  end

end
