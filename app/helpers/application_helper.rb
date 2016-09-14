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
      "Checkout"
    else
      link_to 'Login or Create Account to Checkout', login_path
    end
  end
end
