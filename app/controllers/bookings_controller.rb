class BookingsController < ApplicationController
  layout "pages"
  def index
    @bookings = Booking.all
    @restricted_bookings = Booking.where(warrior_id: params[:warrior_id]).order(created_at: :desc)
    @warrior = Warrior.find(params[:warrior_id])
  end

  def new
    @travel = Travel.find(params[:travel_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @travel = Travel.find(params[:travel_id])
    @booking = Booking.new(booking_params)
    if @booking.weight <= @travel.weight_left
      @booking.total_price = @travel.price
      @booking.date = @travel.arrival_date
      @booking.user_id = @user.id
      @booking.travel_id = @travel.id
      if @booking.save
        @travel.weight_left = @travel.weight_left - @booking.weight
        @travel.save
        @chat_room = ChatRoom.create(booking_id: @booking.id)
        @chat_room.save
        redirect_to travel_booking_path(@travel, @booking)
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to warriors_path
  end

  def display_resa
    @bookings = current_user.bookings
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
    @warrior = Warrior.find(@booking.warrior_id)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to mybooking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:meeting_place, :date, :total_price, :recipient, :status, :description, :weight)
  end
end
