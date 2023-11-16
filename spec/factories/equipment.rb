FactoryBot.define do
  factory :equipment do
    serial { Faker::Alphanumeric.alphanumeric }

    association :type_equipment, factory: :type_equipment

    trait :empty do
      serial { nil }
    end
  end
end
