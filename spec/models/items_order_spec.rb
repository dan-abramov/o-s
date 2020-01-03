require 'rails_helper'

RSpec.describe ItemsOrder, type: :model do
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end
end
