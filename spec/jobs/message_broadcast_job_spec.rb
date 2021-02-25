require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  let(:message) { FactoryBot.build_stubbed(:message) }

  it 'enqueues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect { MessageBroadcastJob.perform_later(message) }.to have_enqueued_job
  end

  it 'broadcasts the message' do
    expect { MessageBroadcastJob.perform_now(message) }
      .to have_broadcasted_to('chat_room_channel')
      .with(message: "<div class=\"message\">\n  <p>\n    Hello there\n  </p>\n</div>\n")
  end
end
