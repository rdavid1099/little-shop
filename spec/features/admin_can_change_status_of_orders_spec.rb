require 'rails_helper'

RSpec.feature 'admin can change status of orders' do
  scenario 'admin changes the order status on dashboard' do
    admin = make_admin('admin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    make_a_group_of_orders_with_certain_status('vail', 'ordered', 1)
    make_a_group_of_orders_with_certain_status('cabo', 'paid', 1)
    make_a_group_of_orders_with_certain_status('texas', 'cancelled', 1)
    make_a_group_of_orders_with_certain_status('seattle', 'paid', 1)
    visit admin_dashboard_path
    order_1 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'vail_1').id).order
    order_2 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'cabo_1').id).order
    order_3 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'texas_1').id).order
    order_4 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'seattle_1').id).order
    expect(page).to have_content("#{order_1.id} - Status: Ordered")
    expect(page).to have_content("#{order_2.id} - Status: Paid")
    expect(page).to have_content("#{order_3.id} - Status: Cancelled")
    expect(page).to have_content("#{order_4.id} - Status: Paid")

    within('div.orders-list') do
      within('li:nth-child(1)') do
        click_on('Mark as Completed')
      end
    end
    expect(page).to have_content("#{order_4.id} - Status: Completed")

    within('div.orders-list') do
      within('li:nth-child(3)') do
        click_on('Cancelled')
      end
    end
    expect(page).to have_content("#{order_2.id} - Status: Cancelled")

    within('div.orders-list') do
      within('li:nth-child(4)') do
        click_on('Mark as Paid')
      end
    end
    expect(page).to have_content("#{order_1.id} - Status: Paid")

  end
end
