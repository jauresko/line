class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :new
  layout 'chat_rooms'

  def index
    if params[:from].present? && params[:to].present?
      @purachases = Purchase.where("purchase_place ILIKE ?", "%#{params[:from]}%").where("delivery_place ILIKE ?", "%#{params[:to]}%")
      # raise
    else
      @purchases = Purchase.all
    end
  end

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @user = current_user
    @purchase = Purchase.new(purchase_params)
    @purchase.user = @user
    if @purchase.save
      redirect_to mypurchase_path(@purchase)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @purchase.update(purchase_params)
    if @purchase.status == "Delivered"
      @purchase.order.status = "Done"
      @purchase.order.save
    end
    redirect_to mypurchase_path
  end

  def destroy
    @purchase.destroy

    redirect_to purchases_path
  end

  def mypurchase
    @purchases = current_user.purchases
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:product_url, :name, :photo, :purchase_place, :seller, :price, :bonus_traveler, :delivery_place, :status)
  end
end
