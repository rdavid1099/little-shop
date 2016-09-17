class UsersController < BaseController
  skip_before_action :validate_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @cart.empty? ? redirect_to(dashboard_path) : redirect_to(cart_path)
    else
      flash.now['alert-danger'] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def dashboard
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      flash.now['alert-danger'] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end
end
