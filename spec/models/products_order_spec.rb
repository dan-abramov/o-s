require 'rails_helper'

RSpec.describe ProductsOrder, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end
end
