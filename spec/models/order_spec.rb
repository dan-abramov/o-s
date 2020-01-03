require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
end
