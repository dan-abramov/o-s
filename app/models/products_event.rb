class ProductsEvent < ApplicationRecord
  belongs_to :product
  belongs_to :event
end
