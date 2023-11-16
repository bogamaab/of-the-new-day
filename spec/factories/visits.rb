FactoryBot.define do
  factory :visit do
    timeslots { "#{Faker::Number.number(digits: 2)}-#{Faker::Number.number(digits: 2)}" }
    start_visit { Time.zone.now.strftime("%H:%M:%S") }
    end_visit { (start_visit + 2.hours).strftime("%H:%M%S") }
    reshedule { false }
    quality { 0 }

    association :client, factory: :client
    association :material, factory: :material
    association :equipment, factory: :equipment
    association :user, factory: :user
    #association :work_order, factory: :work_order
    #association :reports, factory: :reports

    trait :empty do
      timeslots { nil }
      start_visit { nil}
      end_visit { nil }
      reshedule { nil }
      quality { nil }
    end
  end
end
