class Cart
  attr_reader :cart

  def initialize(cart)
    @cart = cart || {}
  end

  def update_cart(trip_id)
    @cart[trip_id.to_s] ||= 0
    @cart[trip_id.to_s] += 1
    @cart
  end

  def count
    @cart.values.sum
  end

  def num_of_trip_in_cart(trip_id)
    @cart[trip_id.to_s]
  end

  def total_price_of_trip(trip_id)
    @cart[trip_id.to_s].to_f * Trip.find(trip_id).price.to_f
  end

  def total_price
    @cart.reduce(0) do |result, (trip_id, quantity)|
      result + Trip.find(trip_id).price.to_f * quantity
    end
  end
end
