class OrdersController < ApplicationController
  def create
    creator = OrderCreator.new(current_user, @cart)
    creator.create
    flash['alert-success'] = 'Order was successfully placed'
    redirect_to orders_path
  end

  def index
    @orders = current_user.orders
  end
end
