FactoryBot.define do
  factory :message do
    body { "Hello there" }
    association :user, factory: :user
  end
end
