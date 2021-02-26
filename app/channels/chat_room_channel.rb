class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for chat_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(body: data["message"], user: self.connection.current_user, chat_room_id: data["chat_room_id"])
  end

  def chat_room
    ChatRoom.find(params[:chat_room_id])
  end
end
