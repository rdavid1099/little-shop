class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def dashboard
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end
end