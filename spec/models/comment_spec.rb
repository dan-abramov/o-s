require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'db column' do
    it { should have_db_column(:commentable_id).of_type(:integer) }
    it { should have_db_column(:commentable_type).of_type(:string) }
  end
end
