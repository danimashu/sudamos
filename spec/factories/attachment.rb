FactoryGirl.define do
  factory :attachment do
    lg_url { "http://lorempixel.com/700/450/sports/1/" }
    md_url { "http://lorempixel.com/360/200/sports/1/" }
    sm_url { "http://lorempixel.com/48/48/sports/1/" }
    advert
  end
end
