require 'rails_helper'

RSpec.feature 'authenticated user security' do
  scenario 'authenticated user cannot see other user private data' do
    user_1 = make_user('user_1')
    user_1_trip = make_trip('vail')
    user_1_order = make_orders_trip(user_1, user_1_trip)
    make_user('user_2')
    visit login_path
    fill_in 'sessions_username', with: 'user_2_test'
    fill_in 'sessions_password', with: 'testing'
    click_on 'Log In'
    visit order_path(user_1_order.order_id)
    expect(page).to have_content('404')
  end

  scenario 'authenticated user cannot view admin pages' do
    user_2 = make_user('user')
    visit login_path
    fill_in 'sessions_username', with: 'user_test'
    fill_in 'sessions_password', with: 'testing'
    click_on 'Log In'
    visit admin_dashboard_path
    expect(page).to have_content('404')
  end
end
