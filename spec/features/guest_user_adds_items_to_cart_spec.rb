require 'rails_helper'

RSpec.feature 'guest user adds items to cart' do
  scenario 'guest user adds items to cart and logins in to checkout' do
    make_trip('Bermuda')
    make_trip('Basement')
    trip1 = Trip.first
    trip2 = Trip.last
    visit trip_path(trip1)
    click_on 'Add to Cart'
    visit trip_path(trip2)
    click_on 'Add to Cart'
    click_on 'Login or Create Account to Checkout'
    click_on 'Create Account'
    fill_in 'user_name', with: 'Test Tester'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_username', with: 'test'
    fill_in 'user_password', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content('1 - Bermuda - $199.99')
    expect(page).to have_content('1 - Basement - $199.99')
    expect(page).to have_content('Logged in as test')
    expect(page).to have_content('Checkout')
  end
end
