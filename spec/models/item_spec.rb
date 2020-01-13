require 'rails_helper'
require 'models/concerns/commentable_spec.rb'

RSpec.describe Item, type: :model do
  it_behaves_like 'commentable'

  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:ratings) }
    it { should have_many(:orders) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
