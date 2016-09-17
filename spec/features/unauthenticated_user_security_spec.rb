require 'rails_helper'

RSpec.feature 'unauthenticated user security' do
  scenario 'unauthenticated user cannot view private data' do
    user_1 = make_user('user_1')
    user_1_trip = make_trip('vail')
    user_1_order = make_orders_trip(user_1, user_1_trip)
    visit order_path(user_1_order.order_id)
    expect(page).to have_content('404')
  end

  scenario 'unauthenticated user cannot view admin pages' do
    visit admin_dashboard_path

    expect(page).to have_content('404')
  end
end
