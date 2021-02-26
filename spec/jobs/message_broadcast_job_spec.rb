require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  let(:message) { FactoryBot.build_stubbed(:message) }

  it 'enqueues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect { MessageBroadcastJob.perform_later(message) }.to have_enqueued_job
  end
end
