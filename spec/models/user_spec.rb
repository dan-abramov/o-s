require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:ratings) }
    it { should have_many(:orders) }
    it { should have_many(:subscriptions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
