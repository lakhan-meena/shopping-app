class OrdersController < ApplicationController

  def checkout
  	@order = current_order
  end

  def update_order_details
  	@order = current_order
  	@order.update(order_params)
  	session[:order_id] = nil
  	redirect_to products_path
  end

  private
  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :email, :phone_mumber, :state, :city, :country, :zip)
  end

end
