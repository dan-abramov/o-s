class Item < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :category
  has_many :comments
  has_many :ratings
end
