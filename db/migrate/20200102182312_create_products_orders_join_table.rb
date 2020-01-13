class CreateProductsOrdersJoinTable < ActiveRecord::Migration[5.2]
  create_table :products_orders do |t|
    t.references :order, foreign_key: true
    t.references :product, foreign_key: true

    t.timestamps
  end
end
