require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  describe 'associations' do
    it { should have_many(:products) }
  end
end
