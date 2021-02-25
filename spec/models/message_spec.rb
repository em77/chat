require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    ActiveJob::Base.queue_adapter = :test
    Message.create(body: "Testing 123")
  end

  it 'should enqueue MessageBroadcastJob' do
    expect(MessageBroadcastJob).to have_been_enqueued
  end
end
