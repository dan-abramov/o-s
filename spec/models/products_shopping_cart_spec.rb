require 'rails_helper'

RSpec.describe ProductsShoppingCart, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:shopping_cart) }
end
