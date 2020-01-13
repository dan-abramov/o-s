class Event < ApplicationRecord
  validates :start_date, :end_date, presence: true

  has_many :products_event
  has_many :products, through: :products_event
end
