class Event < ApplicationRecord
  validates :start_date, :end_date, presence: true

  has_many :items_event
  has_many :items, through: :items_event
end
