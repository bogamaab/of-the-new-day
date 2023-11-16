FactoryBot.define do
  factory :equipment do
    serial { Faker::Alphanumeric.alphanumeric }
    amount { Faker::Number.digit.to_s }

    association :type_equipment, factory: :type_equipment

    trait :empty do
      serial { nil }
      amount { nil }
    end
  end
end
