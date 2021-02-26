FactoryBot.define do
  factory :chat_room do
    name { "The Break Room" }

    trait :different_name do
      name { "Fun Times" }
    end
  end
end
