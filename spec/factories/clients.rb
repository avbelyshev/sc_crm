FactoryBot.define do
  factory :client do
    sequence :email do |n|
      "client#{n}@test.com"
    end
    password { '12345678' }
  end
end
