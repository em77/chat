FactoryBot.define do
  factory :user do
    name { "Fellow Human" }
    password { "password" }
    password_confirmation { "password" }
  end
end
