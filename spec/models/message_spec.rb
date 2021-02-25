require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    ActiveJob::Base.queue_adapter = :test
    FactoryBot.create(:message, body: "Testing 123")
  end

  it { should belong_to(:user) }

  it 'should enqueue MessageBroadcastJob' do
    expect(MessageBroadcastJob).to have_been_enqueued
  end
end
