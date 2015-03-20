FactoryGirl.define do
  factory :contact do
    email { Faker::Internet.email }
    message { Faker::Lorem.sentence }
  end
end
