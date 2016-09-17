class Admin::UsersController < Admin::BaseController
  def dashboard
    @user = current_user
    @orders = Order.all
    @orders_status = orders_filter(params[:status])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to admin_dashboard_path
    else
      flash.now['alert-danger'] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end

  def orders_filter(params)
    if params.nil?
      Order.all
    else
      Order.statuses(params)
    end
  end
end
