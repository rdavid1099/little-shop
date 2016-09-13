class CartsController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    session[:cart] = @cart.update_cart(trip.id)
    redirect_to carts_path
  end

  def index
    @trips = @cart.cart.keys.map { |id| Trip.find(id) }
  end
end
