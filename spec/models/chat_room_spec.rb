require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it { should have_many(:messages) }
end
