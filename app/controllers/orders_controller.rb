class OrdersController < ApplicationController
  def create
    creator = OrderCreator.new(current_user, @cart)
    creator.create
    flash['alert-success'] = 'Order was successfully placed'
    session[:cart] = nil
    redirect_to orders_path
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
