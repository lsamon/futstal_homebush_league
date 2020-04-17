FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    role { :player }
    date_of_birth { Time.current - 20.years }
    password { SecureRandom.hex }
  end
end