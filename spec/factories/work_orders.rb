FactoryBot.define do
  factory :work_order do
    node { Faker::Alphanumeric.alphanumeric(max_limit: 10) }
    failure_note { Faker::Lorem.paragraph }
    marker { Faker::Internet.mac_adderss }
    closing_note { Faker::Lorem.paragraph }

    association :type_work_order, factory: :type_work_order

    trait :empty do
      node { nil }
      failure_note { nil }
      marker { nil }
      closing_note { nil }
    end
  end
end
