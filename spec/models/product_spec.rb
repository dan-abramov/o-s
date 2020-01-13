require 'rails_helper'
require 'models/concerns/commentable_spec.rb'

RSpec.describe Product, type: :model do
  it_behaves_like 'commentable'

  describe 'associations' do
    it { should have_many(:ratings) }
    it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end
