require 'rails_helper'

RSpec.feature 'logged in user can checkout' do
  scenario 'user is logged in and has item in cart' do
    user = make_user('test')
    trip = make_trip('Bermuda')
    visit trips_path
    click_on 'Login'
    fill_in 'sessions_username', with: 'test_test'
    fill_in 'sessions_password', with: 'testing'
    click_on 'Log In'
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
