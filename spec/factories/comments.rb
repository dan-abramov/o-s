FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { nil }
    item { nil }
  end
end
