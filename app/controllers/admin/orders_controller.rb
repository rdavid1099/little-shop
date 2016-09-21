class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find_by(id: params[:id])
    render file: 'public/404' if @order.nil?
  end

  def update
    order = Order.find(params[:id])
    order.status = params[:status]
    order.save
    redirect_to admin_dashboard_path
  end
end
