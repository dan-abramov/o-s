FactoryBot.define do
  factory :item do
    title { "MyString" }
    body { "MyText" }
    category { nil }
  end

  factory :incorrect_item, class: 'Item' do
    title { nil }
    body { nil }
    category { nil }
  end

end
