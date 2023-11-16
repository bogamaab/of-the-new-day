FactoryBot.define do
  factory :type_equipment do
    name { Faker::Internet.domain_name }
    type { Faker::Internet.domain_word }

    trait :empty do
      name { nil }
      type { nil }
    end
  end
end
