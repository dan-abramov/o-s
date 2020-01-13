require 'rails_helper'

RSpec.describe ProductsEvent, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:event) }
end
