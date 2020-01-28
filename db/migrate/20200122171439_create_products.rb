class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, index: true
      t.string :title
      t.string :sku
      t.string :part_number
      t.text :description
      t.integer :status, default: 0
      t.datetime :imported_date
      t.integer :product_loaded, default: 0
      t.string :product_image
      t.decimal :price, precision: 8, scale: 2
      t.decimal :discount, precision: 8, scale: 2
      t.integer :on_hand, default: 0
      t.timestamps
    end
  end
end


