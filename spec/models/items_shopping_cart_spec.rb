require 'rails_helper'

RSpec.describe ItemsShoppingCart, type: :model do
  it { should belong_to(:item) }
  it { should belong_to(:shopping_cart) }
end
