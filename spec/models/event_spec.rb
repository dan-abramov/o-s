require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should have_many(:products).through(:products_event) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
end
