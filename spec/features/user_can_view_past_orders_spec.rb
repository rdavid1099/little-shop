require 'rails_helper'

RSpec.feature 'User can view past orders' do
  scenario 'logged in user can view all past orders' do
    user = make_user('test')
    trip = make_trip('alabama')
    make_orders_trip(user, trip)
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit orders_path

    within('.col-md-10') do
      expect(page).to have_content(trip.orders.last.id)
    end
  end
end
