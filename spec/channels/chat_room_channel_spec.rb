require 'rails_helper'

RSpec.describe ChatRoomChannel, type: :channel do
  let(:chat_room) { FactoryBot.create(:chat_room) }

  before { allow_any_instance_of(ChatRoomChannel).to receive(:chat_room).and_return(chat_room) }

  it "subscribes to the channel" do
    subscribe
    expect(subscription).to be_confirmed
  end

  describe "#speak" do
    let(:data) { { "message" => SecureRandom.uuid, "chat_room_id" => chat_room.id } }
    let(:user) { FactoryBot.create(:user) }

    before do
      stub_connection current_user: user
      subscribe
    end

    it "should create a message" do
      expect { perform :speak, data }.to change { Message.count }
      message = Message.find_by_body(data["message"])
      expect(message.nil?).to_not be true
      expect(message.user_id).to eq user.id
      expect(message.chat_room_id).to eq chat_room.id
    end
  end
end
