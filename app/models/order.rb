class Order < ApplicationRecord
  belongs_to :user
  has_many :items_orders
  has_many :items, through: :items_orders
end
