class Rating < ApplicationRecord
  validates :rate, presence: true

  belongs_to :user
  belongs_to :item
end
