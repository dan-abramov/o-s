require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:ratings) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
