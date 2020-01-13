require 'rails_helper'
require 'models/concerns/commentable_spec.rb'

RSpec.describe Order, type: :model do
  it_behaves_like 'commentable'

  describe 'associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
end
