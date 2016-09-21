module ApplicationHelper
  def display_checkout
    if @cart.total_price.zero?
      'Your Cart is Empty'
    elsif logged_in?
      link_to 'Checkout', orders_path, method: :post
    else
      link_to 'Login or Create Account to Checkout', login_path
    end
  end

  def display_trip_status
    if @trip.status == 'active'
      button_to 'Add to Cart', cart_path(trip_id: @trip.id), method: :post, class: 'btn btn-success'
    else
      'Trip Expired'
    end
  end

  def display_order_admin_options(order_id, status)
    if status == 'ordered'
      "#{link_to 'Mark as Paid', admin_order_path(id: order_id, status: 'paid'), method: :patch} | #{link_to 'Cancelled', admin_order_path(id: order_id, status: 'cancelled'), method: :patch}"
    elsif status == 'paid'
      "#{link_to 'Mark as Completed', admin_order_path(id: order_id, status: 'completed'), method: :patch} | #{link_to 'Cancelled', admin_order_path(id: order_id, status: 'cancelled'), method: :patch}"
    else
      ""
    end
  end
end
