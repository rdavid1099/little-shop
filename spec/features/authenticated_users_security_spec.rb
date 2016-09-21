require 'rails_helper'

RSpec.feature 'Authenticated user security' do
  scenario 'authenticated user cannot see other user private data' do
    user_1 = make_user('user_1')
    user_1_trip = make_trip('vail')
    user_1_order = make_orders_trip(user_1, user_1_trip)

    user_2 = make_user('user_2')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user_2)

    visit order_path(user_1_order.order_id)

    expect(page).to have_content('404')
  end

  scenario 'authenticated user cannot view admin pages' do
    user = make_user('user')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path

    expect(page).to have_content('404')
  end
end
