class User < ApplicationRecord
  validates :name, presence: true

  has_many :orders
  has_many :comments
  has_many :ratings
  has_many :subscriptions
end
