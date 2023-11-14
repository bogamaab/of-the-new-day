FactoryBot.define do
  factory :consultant do
    association :user, factory: :user
  end
end
