class ShoppingCart < ApplicationRecord
  has_many :products_shopping_carts
  has_many :products, through: :products_shopping_carts
end
