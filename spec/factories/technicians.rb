FactoryBot.define do
  factory :technician do
    association :user, factory: :user
  end
end
