require 'rails_helper'

RSpec.feature 'user can view single past order' do
  context 'signed in user can see past order of one quantity' do
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

  context 'user selects one of several orders with multiple trips' do
    scenario 'user views order with multiple trips order' do
      user = make_user('test')
      trip = make_trip('alabama')
      make_orders_trip(user, trip, 2)
      make_orders_trip(user, trip)
      order1 = Order.first
      order2 = Order.last
      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit orders_path
      click_on order1.id.to_s

      expect(page).to have_content('2')
      expect(page).to have_content('alabama')
      expect(page).to have_content('$399.98')
      expect(page).to have_link(trip.title, href: trip_path(trip))
      expect(page).to have_content('Status: Ordered')
      expect(page).to have_content('Total Price: $399.98')
      expect(page).to have_content(order1.created_at.to_s)
      expect(page).to have_content(order1.updated_at.to_s)

      visit orders_path
      click_on order2.id.to_s
      expect(page).to have_content('1')
      expect(page).to have_content('alabama')
      expect(page).to have_content('$199.99')
      expect(page).to have_link(trip.title, href: trip_path(trip))
      expect(page).to have_content('Status: Ordered')
      expect(page).to have_content('Total Price: $199.99')
      expect(page).to have_content(order2.created_at.to_s)
      expect(page).to have_content(order2.updated_at.to_s)
    end
  end
end
