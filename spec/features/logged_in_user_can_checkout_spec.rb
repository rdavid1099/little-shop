require 'rails_helper'

RSpec.feature 'Logged in user can checkout' do
  scenario 'user is logged in and has item in cart' do
    trip = make_trip('Bermuda')
    user = make_user('user')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit trip_path(trip)
    click_on 'Add to Cart'
    click_on 'Checkout'

    expect(page).to have_current_path('/orders')
    within('div.alert') do
      expect(page).to have_content('Order was successfully placed')
    end
    within('.col-md-10') do
      expect(page).to have_content(trip.orders.last.id)
    end
  end
end
