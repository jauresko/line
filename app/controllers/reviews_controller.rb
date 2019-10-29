class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]

  def index
  end

  def show
    @booking = Booking.find(params[:booking_id])
    @quest = Quest.find(@booking.quest.id)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @travel = @booking.travel
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.user_id = @booking.travel.user_id
    @user = User.find(@booking.travel.user_id)
    if @review.save
      @user.deliveries.nil? ? @user.deliveries = 1 : @user.deliveries += 1
      @user.sum_rating.nil? ? @user.sum_rating = @review.rating : @user.sum_rating += @review.rating
      @user.average_rating = @user.sum_rating / @user.deliveries
      @user.save
      @booking.review_id = @review.id
      @booking.save
      redirect_to mybooking_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
