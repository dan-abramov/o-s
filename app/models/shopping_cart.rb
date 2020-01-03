class ShoppingCart < ApplicationRecord
  has_many :items_shopping_carts
  has_many :items, through: :items_shopping_carts
end
