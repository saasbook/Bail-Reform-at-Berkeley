FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "12345" }
    password_confirmation { "12345" }
    confirmed_at { Date.today }
  end
end
