class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def trip_successfully_removed(trip)
    "Successfully removed #{view_context.link_to trip.title, trip_path(trip.id)} from your cart"
  end
end
