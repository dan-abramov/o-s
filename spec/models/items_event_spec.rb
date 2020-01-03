require 'rails_helper'

RSpec.describe ItemsEvent, type: :model do
  it { should belong_to(:item) }
  it { should belong_to(:event) }
end
