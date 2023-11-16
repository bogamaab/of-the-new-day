FactoryBot.define do
  factory :material do
    amount { Faker::Number.digit.to_s }

    association :type_material, factory: :type_material

    trait :empty do
      amount { nil }
    end
  end
end
