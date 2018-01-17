FactoryBot.define do
  factory :event do
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          100
    includes_food     true
    includes_drinks   true
    starts_at         { Faker::Date }
    ends_at           { Faker::Date }
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
