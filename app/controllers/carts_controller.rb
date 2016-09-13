class CartsController < ApplicationController

  def create
    session[:cart] = @cart.update_cart(params[:trip_id])
    redirect_to carts_path
  end

  def index
    @trips = @cart.cart.keys.map { |id| Trip.find(id) }
  end

end
