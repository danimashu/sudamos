FactoryGirl.define do
  factory :user do
    professional false
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "123456"
    password_confirmation "123456"
    confirmed_at Time.zone.now
    terms "1"
  end
end
