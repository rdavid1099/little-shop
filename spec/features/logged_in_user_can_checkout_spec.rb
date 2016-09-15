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
    within('tr') do
      expect(page).to have_content(trip.orders.last.id)
    end
  end
end

# As a visitor
#   When I add items to my cart
#   And I visit "/cart"
#   And I click "Login or Register to Checkout"
#   Then I should be required to login
#   When I am logged in
#   And I visit my cart
#   And when I click "Checkout"
#   Then the order should be placed
#   And my current page should be "/orders"
#   And I should see a message "Order was successfully placed"
#   And I should see the order I just placed in a table
