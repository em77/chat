class ChatRoomsController < ApplicationController
  def index
    #
  end

  def show
    @messages = Message.all.order(created_at: :desc)
  end
end
