class CartController < ApplicationController
  def create
    session[:cart] = @cart.update_cart(params[:trip_id])
    redirect_to cart_path
  end

  def index
    @trips = @cart.cart.keys.map { |id| Trip.find(id) }
  end

  def edit
    @trip = Trip.find_by(id: params[:trip_id])
    render file: 'public/404' if @trip.nil?
  end

  def update
    session[:cart] = @cart.change_quantity(quantity_params[:trip_id], quantity_params[:quantity])
    redirect_to cart_path
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    session[:cart] = @cart.remove_trip(trip.id)
    flash['alert-success'] = "Successfully removed #{view_context.link_to trip.title, trip_path(trip.id)} from your cart"

    redirect_to cart_path
  end

  private

  def quantity_params
    params.permit(:trip_id, :quantity)
  end
end
