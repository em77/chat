FactoryBot.define do
  factory :message do
    body { "Hello there" }
    association :user, factory: :user
    association :chat_room, factory: :chat_room

    trait :different_everything do
      body { "Hello world" }
      association :user, factory: [:user, :different_name]
      association :chat_room, factory: [:chat_room, :different_name]
    end
  end
end
