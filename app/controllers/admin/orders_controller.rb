class Admin::OrdersController < Admin::BaseController
  def dashboard
    @user = current_user
  end
end
