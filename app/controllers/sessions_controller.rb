class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = user.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
  end
end
