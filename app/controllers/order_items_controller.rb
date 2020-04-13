class OrderItemsController < ApplicationController

	def create
		@order = current_order
    @current_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
    if @current_item.present?
    	OrderItem.update_item(@order, order_item, @current_item)
    else
    	OrderItem.add_item(@order, order_item)
    end	
    	flash[:success] = "Item added to the cart"
      session[:order_id] = @order.id
      redirect_to request.referrer
	end

	def update
		
	end

	def destroy
		@order = current_order
		order_item = @order.order_items.find_by(id: params[:id])
		if order_item.present?
			order_item.destroy
			flash[:success] = "Item Removed"
			Order.save_order_total(@order)
		end
		if @order.order_items.length < 1
			@order.destroy
			session[:order_id] = nil
		end
		redirect_to request.referrer
	end

	private
	def order_item
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
