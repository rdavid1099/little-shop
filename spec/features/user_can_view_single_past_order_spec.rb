require 'rails_helper'

RSpec.feature 'user can view single past order' do
  scenario 'signed in user can see a single order' do
    user = make_user('test')
    trip = make_trip('alabama')
    make_orders_trip(user, trip)
    order = Order.last
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit orders_path
    click_on order.id.to_s

    expect(page).to have_content('1')
    expect(page).to have_content('alabama')
    expect(page).to have_content('$199.99')
    expect(page).to have_link(trip.title, href: trip_path(trip))
    expect(page).to have_content('Status: Ordered')
    expect(page).to have_content('Total Price: $199.99')
    expect(page).to have_content(order.created_at.to_s)
    expect(page).to have_content(order.updated_at.to_s)
  end
end
