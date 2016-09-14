module ApplicationHelper
  def display_navbar
    if logged_in?
      "Logged in as #{link_to @user.username, dashboard_path} | #{link_to 'Logout', logout_path, method: :delete}"
    else
      "#{link_to 'Login', login_path} | #{link_to 'Sign Up', new_user_path}"
    end
  end
end
