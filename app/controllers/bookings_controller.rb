class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @restricted_bookings = Booking.where(warrior_id: params[:warrior_id]).order(created_at: :desc)
    @warrior = Warrior.find(params[:warrior_id])
  end

  def new
    if params[:travel_id]
      @travel = Travel.find(params[:travel_id])
    else
      @purchase = Purchase.find(params[:purchase_id])
    end
    @booking = Booking.new
  end

  def create
    @user = current_user
    @travel = Travel.find(params[:travel_id])
    @booking = Booking.new(booking_params)
    @booking.total_price = @travel.price
    @booking.date = @travel.arrival_date
    @booking.user_id = @user.id
    @booking.travel_id = @travel.id
    if @booking.save
      redirect_to travel_booking_path(@travel, @booking)
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

  def display_bookings
    @warriors = current_user.warriors
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
    @warrior = Warrior.find(@booking.warrior_id)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to warrior_booking_path(@booking)
  end

  def accept
    raise
    @booking = current_user.bookings.find(params[:id])
    @warrior = Warrior.find(@booking.warrior_id)
    redirect_to warriors_path
  end

  private

  def booking_params
    params.require(:booking).permit(:meeting_place, :date, :drop_place, :total_price, :recipient)
  end

  def price_calculator
    @warrior = Warrior.find(params[:warrior_id])
    @price = @warrior.price
    @days = (@booking.end_date - @booking.start_date).to_i + 1
    @total_price = @price * @days
    @booking.total_price = @total_price
  end

end
