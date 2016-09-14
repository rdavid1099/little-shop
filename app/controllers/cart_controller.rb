class CartController < ApplicationController
  def create
    session[:cart] = @cart.update_cart(params[:trip_id])
    redirect_to cart_path
  end

  def index
    @trips = @cart.cart.keys.map { |id| Trip.find(id) }
  end

  def edit
    @trip = Trip.find(params[:trip_id])
  end

  def update
    session[:cart] = @cart.change_quantity(quantity_params[:trip_id], quantity_params[:quantity])
    redirect_to cart_path
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    session[:cart] = @cart.remove_trip(trip.id)
    flash['alert-success'] = trip_successfully_removed(trip)

    redirect_to cart_path
  end

  private

  def quantity_params
    params.permit(:trip_id, :quantity)
  end
end
