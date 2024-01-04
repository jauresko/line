class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @travel = Travel.find(params[:travel_id])
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @booking = Booking.find(@chat_room.booking_id)
    @message.chat_room = @chat_room
    @message.user = current_user
    @message.time = Time.now
    if @message.save
      if current_user === @booking.user
        # mail = MessageMailer.with(receiver: @travel.user ).message
        # mail.deliver_now
        respond_to do |format|
          format.html { redirect_to chat_room_path(@travel, @chat_room) }
          format.js
        end
      else
        # mail = MessageMailer.with(receiver: @booking.user).message
        # mail.deliver_now
        respond_to do |format|
          format.html { redirect_to chat_room_path(@travel, @chat_room) }
          format.js
        end
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
