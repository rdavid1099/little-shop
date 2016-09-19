class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  before_action :set_cart
  before_action :set_categories

  def set_categories
    @categories = Category.all
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
    !current_user.nil?
  end

  def trip_successfully_removed(trip)
    "Successfully removed #{view_context.link_to trip.title, trip_path(trip.id)} from your cart"
  end
end
