class Product < ApplicationRecord
  include Commentable
  validates :title, :body, presence: true

  belongs_to :category, optional: true
  has_many :ratings

  has_many :products_orders
  has_many :orders, through: :products_orders

  has_many :products_events
  has_many :events, through: :products_events

  has_many :products_shopping_carts
  has_many :shopping_carts, through: :products_shopping_carts
end
