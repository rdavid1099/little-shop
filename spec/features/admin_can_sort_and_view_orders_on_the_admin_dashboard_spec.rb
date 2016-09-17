require 'rails_helper'

RSpec.feature 'Admin can view orders on dashboard path' do
  scenario 'sees all the orders listed by status type' do
    admin = make_admin('admin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    make_a_group_of_orders_with_certain_status('vail', 'ordered', 1)
    make_a_group_of_orders_with_certain_status('cabo', 'paid', 1)
    visit admin_dashboard_path
    expect(page).to have_content("Ordered: 1")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_link(Order.first.id, href: admin_order_path(Order.first.id))
    expect(page).to have_link(Order.last.id, href: admin_order_path(Order.last.id))
  end
end
