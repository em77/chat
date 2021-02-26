class ChatRoomsController < ApplicationController
  attr_accessor :messages, :chat_rooms, :chat_room
  helper_method :messages, :chat_rooms, :chat_room

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    respond_to do |format|
      if chat_room.save
        format.html { redirect_to root_path, notice: "#{chat_room.name} was created" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
