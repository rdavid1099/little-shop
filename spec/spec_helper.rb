RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :mocha
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def make_admin(name)
  User.create(name: name.to_s,
              username: 'admin',
              password: 'password',
              email: 'admin@email.com',
              role: 1)
end

def make_user(name)
  User.create(name: name.to_s,
              email: "#{name}@#{name}.com",
              username: "#{name}_test",
              password: 'testing')
end

def make_trip(location, status = 'active')
  Trip.create(title: location.to_s,
              description: 'description',
              price: '199.99',
              image: 'image.jpg',
              status: status)
end

def make_orders_trip(user, trip, quantity = 1, status = 'ordered')
  order = make_order(user, status)
  OrdersTrip.create(order_id: order.id,
                    trip_id: trip.id,
                    quantity: quantity)
end

def make_order(user, status = 'ordered')
  Order.create(user_id: user.id,
               status: status)
end

def create_category(title)
  Category.create(title: title.to_s)
end

def make_a_group_of_orders_with_certain_status(place, status, number_of_trips)
  number_of_trips.times do |index|
    index += 1
    user = make_user("user_#{index}")
    trip = make_trip("#{place}_#{index}")
    make_orders_trip(user, trip, 1, status)
  end
end
