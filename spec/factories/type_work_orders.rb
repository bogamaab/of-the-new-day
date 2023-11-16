FactoryBot.define do
  factory :type_work_order do
    description { Faker::Beer.malts }

    trait :empty do
      description { nil }
    end
  end
end
