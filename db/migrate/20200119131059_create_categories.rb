class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.text :description
      t.boolean :has_children, default: false
      t.timestamps
    end
  end
end
