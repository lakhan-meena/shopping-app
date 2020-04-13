class CartsController < ApplicationController

	def index
		if current_order.present? && current_order.order_items.present?
			@order_items = current_order.order_items
		else
			@order_items = []
		end
	end

end
