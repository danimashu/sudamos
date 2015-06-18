FactoryGirl.define do
  factory :article do
    published true
    title { Faker::Lorem.sentence(3, true, 3) }
    teaser { Faker::Lorem.sentences }
    body { Faker::Lorem.paragraphs(10) }
    sequence(:thumbnail_link) { |n| "http://lorempixel.com/500/280/sports/#{n}/" }
  end
end
