class CartController < ApplicationController
  def create
    session[:cart] = @cart.update_cart(params[:trip_id])
    redirect_to cart_path
  end

  def index
    @trips = @cart.cart.keys.map { |id| Trip.find(id) }
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    session[:cart] = @cart.remove_trip(trip.id)
    flash[:notice] = "Successfully removed #{link_to(trip.title, trip_path(trip.id)} from your cart"
    trip.destroy
    redirect_to cart_path
  end
end
