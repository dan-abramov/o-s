class Order < ApplicationRecord
  include Commentable
  belongs_to :user, optional: true
  has_many :products_orders
  has_many :products, through: :products_orders
end
