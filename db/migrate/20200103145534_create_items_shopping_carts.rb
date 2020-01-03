class CreateItemsShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :items_shopping_carts do |t|
      t.references :item, foreign_key: true
      t.references :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
