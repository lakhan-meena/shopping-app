class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.decimal :item_price, precision: 12, scale: 2
      t.decimal :total_price, precision: 12, scale:2
      t.integer :quantity
      t.timestamps
    end
  end
end
