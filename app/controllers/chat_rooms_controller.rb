class ChatRoomsController < ApplicationController
  def show
    @messages = Message.all
  end
end
