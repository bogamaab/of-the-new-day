FactoryBot.define do
  factory :city do
    description { Faker::Nation.capital_city }
  end
end
