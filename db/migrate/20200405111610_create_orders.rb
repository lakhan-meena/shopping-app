class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.decimal  :subtotal,        precision: 12, scale: 2
	    t.decimal  :tax,             precision: 12, scale: 2
	    t.decimal  :shipping,        precision: 12, scale: 2
	    t.decimal  :total,           precision: 12, scale: 2
	    t.string   :status, 				 default: "Pending"
	    t.string   :first_name
	    t.string   :last_name
	    t.string   :email
	    t.string   :phone_number
	    t.string   :pay_type
	    t.string   :address
	    t.string   :city
	    t.string	 :state
	    t.string   :zip
	    t.string   :country
	    t.references :user
      t.timestamps
    end
  end
end
