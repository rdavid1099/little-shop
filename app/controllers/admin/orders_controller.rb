class Admin::OrdersController < ApplicationController
  def dashboard
    @user = current_user
  end
end
