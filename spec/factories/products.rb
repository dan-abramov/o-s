FactoryBot.define do
  factory :product do
    title { "MyString" }
    body { "MyText" }
    category { nil }
  end

  factory :incorrect_product, class: 'Product' do
    title { nil }
    body { nil }
    category { nil }
  end

end
