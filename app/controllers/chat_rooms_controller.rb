class ChatRoomsController < ApplicationController
  layout 'chat_rooms'

  def show
    if params[:booking_id].present?
      @booking = Booking.find(params[:booking_id])
      @chat_room = ChatRoom.includes(messages: :user).find(@booking.chat_room.id)
    else
      @order = Order.find(params[:order_id])
      @chat_room = ChatRoom.includes(messages: :user).find(@order.chat_room.id)
    end
  end
end
