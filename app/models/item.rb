class Item < ApplicationRecord
  include Commentable
  validates :title, :body, presence: true

  belongs_to :category, optional: true
  has_many :comments
  has_many :ratings

  has_many :items_orders
  has_many :orders, through: :items_orders

  has_many :items_events
  has_many :events, through: :items_events

  has_many :items_shopping_carts
  has_many :shopping_carts, through: :items_shopping_carts
end
