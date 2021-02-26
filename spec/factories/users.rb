FactoryBot.define do
  factory :user do
    name { "Fellow Human" }
    password { "password" }
    password_confirmation { "password" }

    trait :different_name do
      name { "Fellow Alien" }
      password { "password" }
      password_confirmation { "password" }
    end
  end
end
