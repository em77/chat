require 'rails_helper'

RSpec.describe ChatRoomChannel, type: :channel do
  it "subscribes to the channel" do
    subscribe
    expect(subscription).to be_confirmed
  end

  describe "#speak" do
    let(:data) { { "message" => "Hello, world!" } }

    before do
      subscribe
    end

    it "should create a message" do
      expect { perform :speak, data }.to change { Message.count }.by(1)
      expect(Message.last.body).to eq "Hello, world!"
    end
  end
end
