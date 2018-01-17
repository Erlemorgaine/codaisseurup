FactoryBot.define do
  factory :event do
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          100
    includes_food     true
    includes_drinks   true
    starts_at         { Faker::Date.forward(4) }
    ends_at           { Faker::Date.forward(5) }
    user              { build(:user) }
    event_type        { Faker::Lorem.words(1) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
