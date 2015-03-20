FactoryGirl.define do
  factory :advert do
    sell true
    title { Faker::Lorem.sentence(3, true, 1) }
    description { Faker::Lorem.paragraphs(5) }
    price { Faker::Number.number(2).to_i }
    phone { Faker::Number.number(9) }
    state
    section
    sport
    user
    important true
  end
end
