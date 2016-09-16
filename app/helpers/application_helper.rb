module ApplicationHelper
  def display_navbar
    if logged_in?
      "Logged in as #{link_to current_user.username, dashboard_path} | #{link_to 'Logout', logout_path, method: :delete}"
    else
      "#{link_to 'Login', login_path} | #{link_to 'Sign Up', new_user_path}"
    end
  end

  def display_checkout
    if logged_in?
      link_to 'Checkout', orders_path, method: :post
    else
      link_to 'Login or Create Account to Checkout', login_path
    end
  end

  def display_trip_status
    if @trip.status == 'active'
      button_to 'Add to Cart', cart_path(trip_id: @trip.id), method: :post
    else
      'Trip Expired'
    end
  end
end
