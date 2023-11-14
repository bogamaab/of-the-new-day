FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification_number { Faker::IDNumber.brazilian_id }
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    contact_number { Faker::Number.number(digits: 7) }

    trait :empty do
      first_name { nil }
      last_name { nil }
      identification_number { nil }
      address { nil }
      email { nil }
      password { nil }
      password_confirmation { nil }
      contact_number { nil }
    end
  end
end
