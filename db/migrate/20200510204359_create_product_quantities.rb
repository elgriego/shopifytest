class CreateProductQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :product_quantities do |t|
      t.string :shopify_id
      t.string :name
      t.integer :actualQuantity
      t.integer :minQuantity, :default => 0

      t.timestamps
    end
  end
end
