require 'rails_helper'

RSpec.feature 'Admin can filter orders' do
  scenario 'and can click on ordered, paid, cancelled, completed to sort trips' do
    admin = make_admin('admin')

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    make_a_group_of_orders_with_certain_status('vail', 'ordered', 1)
    make_a_group_of_orders_with_certain_status('cabo', 'paid', 1)
    make_a_group_of_orders_with_certain_status('texas', 'cancelled', 1)
    make_a_group_of_orders_with_certain_status('seattle', 'completed', 1)

    order_1 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'vail_1').id).order
    order_2 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'cabo_1').id).order
    order_3 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'texas_1').id).order
    order_4 = OrdersTrip.find_by(trip_id: Trip.find_by(title: 'seattle_1').id).order

    visit admin_dashboard_path

    expect(page).to have_link('Ordered', href: '/admin/dashboard?status=ordered')
    expect(page).to have_link('Paid', href: '/admin/dashboard?status=paid')
    expect(page).to have_link('Cancelled', href: '/admin/dashboard?status=cancelled')
    expect(page).to have_link('Completed', href: '/admin/dashboard?status=completed')

    click_on "Ordered"

    expect(page).to have_link(order_1.id, href: admin_order_path(order_1.id))
    expect(page).to_not have_link(order_2.id, href: admin_order_path(order_2.id))
    expect(page).to_not have_link(order_3.id, href: admin_order_path(order_3.id))
    expect(page).to_not have_link(order_4.id, href: admin_order_path(order_4.id))

    visit admin_dashboard_path
    click_on "Paid"

    expect(page).to have_link(order_2.id, href: admin_order_path(order_2.id))
    expect(page).to_not have_link(order_1.id, href: admin_order_path(order_1.id))
    expect(page).to_not have_link(order_3.id, href: admin_order_path(order_3.id))
    expect(page).to_not have_link(order_4.id, href: admin_order_path(order_4.id))

    visit admin_dashboard_path
    within('div.orders-statuses') do
      click_on "Cancelled"
    end

    expect(page).to have_link(order_3.id, href: admin_order_path(order_3.id))
    expect(page).to_not have_link(order_1.id, href: admin_order_path(order_1.id))
    expect(page).to_not have_link(order_2.id, href: admin_order_path(order_2.id))
    expect(page).to_not have_link(order_4.id, href: admin_order_path(order_4.id))

    visit admin_dashboard_path
    click_on "Completed"

    expect(page).to have_link(order_4.id, href: admin_order_path(order_4.id))
    expect(page).to_not have_link(order_1.id, href: admin_order_path(order_1.id))
    expect(page).to_not have_link(order_3.id, href: admin_order_path(order_3.id))
    expect(page).to_not have_link(order_2.id, href: admin_order_path(order_2.id))
  end
end
