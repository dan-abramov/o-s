FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user
    commentable_type { "Product" }
    commentable_id { 1 }
  end

  factory :comment_with_associations, class: 'Comment' do
    body { "MyText" }
    user
    product
  end

  factory :updated_comment, class: 'Comment' do
    body { "UpdatedBody" }
    user { nil }
    product { nil }
  end
end
