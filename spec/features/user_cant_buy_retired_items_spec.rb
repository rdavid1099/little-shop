require 'rails_helper'

RSpec.feature 'User cant buy retired trips' do
  scenario 'user can view retired tripss but cant purchase them' do
    user = make_user('test')
    trip = make_trip('alabama', 'retired')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit trip_path(trip)

    expect(page).to have_content(trip.title.upcase)
    expect(page).to have_content('Trip Expired')
    expect(page).to_not have_content('Add to Cart')
  end
end
