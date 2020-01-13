FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user
    item
  end

  factory :comment_with_associations, class: 'Comment' do
    body { "MyText" }
    user
    item
  end

  factory :updated_comment, class: 'Comment' do
    body { "UpdatedBody" }
    user { nil }
    item { nil }
  end
end
