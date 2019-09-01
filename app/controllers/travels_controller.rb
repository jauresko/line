class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = Travel.all
  end

  def show
  end

  def new
    @travel = Travel.new
  end

  def create
    @user = current_user
    @travel = Travel.new(travel_params)
    @travel.user = @user
    if @travel.save
      redirect_to travel_path(@travel)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @travel.update(travel_params)

    redirect_to travel_path(@travel)
  end

  def destroy
    @travel.destroy

    redirect_to travels_path
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:departure_date, :arrival_date, :arrival_place, :arrival_hour, :pick_up_place, :price)
  end
end
