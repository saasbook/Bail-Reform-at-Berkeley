FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "12345" }
  end
end
