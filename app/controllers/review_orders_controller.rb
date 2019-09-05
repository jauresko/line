class ReviewOrdersController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]

  def index
  end

  def show
    @order = Order.find(params[:order_id])
    @purchase = purchase.find(@order.purchase.id)
  end

  def new
    @order = Order.find(params[:order_id])
    @purchase = @order.purchase
    @review_order = ReviewOrder.new
  end

  def create
    @review_order = ReviewOrder.new(review_params)
    @order = Order.find(params[:order_id])
    if @review_order.save
      @order.review_order_id = @review_order.id
      @order.save
      redirect_to myorder_path
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
    @review_order = ReviewOrder.find(params[:id])
  end

  def review_params
    params.require(:review_order).permit(:rating, :content)
  end
end
