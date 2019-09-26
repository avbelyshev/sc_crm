FactoryBot.define do
  factory :staff do
    sequence :email do |n|
      "staff#{n}@test.com"
    end
    password { '12345678' }
  end
end
