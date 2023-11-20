FactoryBot.define do
  factory :visit do
    timeslots { "#{Faker::Number.number(digits: 2)}-#{Faker::Number.number(digits: 2)}" }
    start_visit { DateTime.now.freeze }
    end_visit { (start_visit + 2.hours) }
    reschedule { false }
    quality { 0 }

    association :client, factory: :client
    association :material, factory: :material
    association :equipment, factory: :equipment
    association :work_order, factory: :work_order
    association :technician, factory: :technician

    trait :empty do
      timeslots { nil }
      start_visit { nil }
      end_visit { nil }
      reschedule { nil }
      quality { nil }
    end
  end
end
