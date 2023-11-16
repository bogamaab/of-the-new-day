FactoryBot.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    account_number { Faker::Alphanumeric.alphanumeric(number: 15, min_numeric: 5) }
    contact_number { Faker::Number.number(digits: 7).to_s }
    association :city, factory: :city

    trait :empty do
      first_name { nil }
      last_name { nil }
      address { nil }
      account_number { nil }
      contact_number { nil }
    end
  end
end
