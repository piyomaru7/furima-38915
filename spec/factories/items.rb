FactoryBot.define do
  factory :item do
    name             { Faker::Name.name }
    explanation      { Faker::Lorem.sentence }
    category_id      { 2 }
    status_id        { 2 }
    postage_id       { 2 }
    area_id          { 2 }
    number_of_day_id { 2 }
    price            { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
