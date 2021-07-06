FactoryBot.define do
  factory :blog do
    blog_title { Faker::Lorem.characters(number:5) }
    blog_text { Faker::Lorem.characters(number:20) }
  end
end