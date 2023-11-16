FactoryBot.define do
  factory :type_material do
    name { Faker::Name.initials }
    code { Faker::Alphanumeric.alphanumeric }
    unit { Faker::Number.digit.to_s }

    trait :empty do
      name { nil }
      code { nil }
      unit { nil }
    end
  end
end
