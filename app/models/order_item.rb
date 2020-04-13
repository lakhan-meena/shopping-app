class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def self.add_item order, params
  	product = Product.find_by(id: params[:product_id].to_i)
  	total_price = params[:quantity].to_i * product.price
		item_price  = product.price
		order.order_items << OrderItem.new(
			product_id: product.id,
			item_price: item_price,
			total_price: total_price,
			quantity: params[:quantity]
		)
		Order.save_order_total(order)
  end

  def self.update_item order, params, current_item 
  	product = Product.find_by(id: params[:product_id].to_i)
  	total_price = (params[:quantity].to_i * product.price) + current_item.total_price
  	quantity = current_item.quantity + params[:quantity].to_i
		current_item.update_attributes(total_price: total_price, quantity: quantity)
		Order.save_order_total(order)
  end

end
