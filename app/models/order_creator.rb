class OrderCreator
  attr_reader :cart, :user

  def initialize(user, cart)
    @cart = cart
    @user = user
  end

  def create
    order = @user.orders.create(status: 'ordered')
    @cart.cart.each do |trip_id, quantity|
      OrdersTrip.create(order_id: order.id, trip_id: trip_id, quantity: quantity)
    end
  end
end
