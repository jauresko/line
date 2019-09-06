class ChatRoomsController < ApplicationController
  def show
    if params[:travel_id].present?
      @travel = Travel.find(params[:travel_id])
      @chat_room = ChatRoom.includes(messages: :user).find(@quest.chat_room.id)
    else
      @purchase = Purchase.find(params[:purchase_id])
    end
  end
end
