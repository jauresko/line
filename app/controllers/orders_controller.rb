class OrdersController < ApplicationController
  def index
    @orders = order.all
    @restricted_orders = order.where(warrior_id: params[:warrior_id]).order(created_at: :desc)
    @warrior = Warrior.find(params[:warrior_id])
  end

  def new
    @purchase = Purchase.find(params[:purchase_id])
    @order = Order.new
  end

  def create
    @user = current_user
    @purchase = Purchase.find(params[:purchase_id])
    @order = Order.new(order_params)
    @order.total_price = @purchase.price
    @order.user_id = @user.id
    @order.purchase_id = @purchase.id
    if @order.save
      @chat_room = ChatRoom.create(order_id: @order.id)
      @chat_room.save
      redirect_to purchase_order_path(@purchase, @order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    redirect_to warriors_path
  end

  def display_resa
    @orders = current_user.orders
  end

  def edit
    @order = current_user.orders.find(params[:id])
    @warrior = Warrior.find(@order.warrior_id)
  end

  def update
    @order = order.find(params[:id])
    @order.update(order_params)
    redirect_to warrior_order_path(@order)
  end

  def accept
    raise
    @order = current_user.orders.find(params[:id])
    @warrior = Warrior.find(@order.warrior_id)
    redirect_to warriors_path
  end

  private

  def order_params
    params.require(:order).permit(:date, :total_price, :status)
  end

  def price_calculator
    @warrior = Warrior.find(params[:warrior_id])
    @price = @warrior.price
    @days = (@order.end_date - @order.start_date).to_i + 1
    @total_price = @price * @days
    @order.total_price = @total_price
  end
end
