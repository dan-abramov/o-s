class Event < ApplicationRecord
  validates :start_date, :end_date, presence: true

  has_many :items
end
