class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true

  def self.save_order_total order
	subtotal = order.order_items.collect { |order_item| order_item.total_price }.sum
	tax = 0
	shipping = 0
	total = subtotal + tax + shipping
	order.update_attributes(subtotal: subtotal, tax: tax, shipping: shipping, total: total)
  end
end
