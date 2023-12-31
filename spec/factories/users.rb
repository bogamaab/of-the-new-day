FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification_number { Faker::ChileRut.rut(min_rut: 10_000_000) }
    address { Faker::Address.full_address }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    contact_number { Faker::Number.number(digits: 7).to_s }
    association :city, factory: :city
    association :document_type, factory: :document_type

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

  trait :with_admin do
    association :admin, factory: :admin
  end

  trait :with_consultant do
    association :consultant, factory: :consultant
  end

  trait :with_technician do
    association :technician, factory: :technician
  end
end
