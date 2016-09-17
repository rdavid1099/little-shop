require 'rails_helper'

RSpec.feature 'Admin can view orders on dashboard path' do
  scenario 'sees all the orders listed by status type' do
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    make_a_group_of_orders_with_certain_status('vail', 'ordered', 3)
    make_a_group_of_orders_with_certain_status('cabo', 'paid', 3)
    make_a_group_of_orders_with_certain_status('texas', 'cancelled', 3)
    make_a_group_of_orders_with_certain_status('seattle', 'completed', 3)
    visit admin_dashboard_path
    expect(page).to have_link('vail_1', href: trip_path("#{Trip.find_by(name: 'vail_1').id}")
    expect(page).to have_link('cabo_2', href: trip_path("#{Trip.find_by(name: 'cabo_2').id}")
    expect(page).to have_link('texas_3', href: trip_path("#{Trip.find_by(name: 'texas_3').id}")
    expect(page).to have_link('seattle_1', href: trip_path("#{Trip.find_by(name: 'seattle_1').id}")
  end

  scenario 'and can click on ordered, paid, cancelled, completed to sort trips' do
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    make_a_group_of_orders_with_certain_status('vail', 'ordered', 3)
    make_a_group_of_orders_with_certain_status('cabo', 'paid', 3)
    make_a_group_of_orders_with_certain_status('texas', 'cancelled', 3)
    make_a_group_of_orders_with_certain_status('seattle', 'completed', 3)
    expect(page).to have_link('Ordered', href: admin_dashboard_path)
    expect(page).to have_link('Paid', href: admin_dashboard_path)
    expect(page).to have_link('Cancelled', href: admin_dashboard_path)
    expect(page).to have_link('Completed', href: admin_dashboard_path)

    visit admin_dashboard_path
    click_on "Ordered"

    expect(page).to have_link('vail_1', href: trip_path("#{Trip.find_by(name: 'vail_1').id}")
    expect(page).to have_link('vail_2', href: trip_path("#{Trip.find_by(name: 'vail_2').id}")
    expect(page).to_not have_link('cabo_2', href: trip_path("#{Trip.find_by(name: 'cabo_2').id}")
    expect(page).to_not have_link('texas_3', href: trip_path("#{Trip.find_by(name: 'texas_3').id}")
    expect(page).to_not have_link('seattle_1', href: trip_path("#{Trip.find_by(name: 'seattle_1').id}")
    expect(page).to have_link('Paid', href: admin_dashboard_path)
    expect(page).to have_link('Cancelled', href: admin_dashboard_path)
    expect(page).to have_link('Completed', href: admin_dashboard_path)

    visit admin_dashboard_path
    click_on "Paid"

    expect(page).to have_link('cabo_1', href: trip_path("#{Trip.find_by(name: 'cabo_2').id}")
    expect(page).to have_link('cabo_2', href: trip_path("#{Trip.find_by(name: 'cabo_1').id}")
    expect(page).to_not have_link('vail_2', href: trip_path("#{Trip.find_by(name: 'vail_2').id}")
    expect(page).to_not have_link('texas_3', href: trip_path("#{Trip.find_by(name: 'texas_3').id}")
    expect(page).to_not have_link('seattle_1', href: trip_path("#{Trip.find_by(name: 'seattle_1').id}")
    expect(page).to have_link('Ordered', href: admin_dashboard_path)
    expect(page).to have_link('Cancelled', href: admin_dashboard_path)
    expect(page).to have_link('Completed', href: admin_dashboard_path)

    visit admin_dashboard_path
    click_on "Cancelled"

    expect(page).to have_link('texas_1', href: trip_path("#{Trip.find_by(name: 'texas_1').id}")
    expect(page).to have_link('texas_2', href: trip_path("#{Trip.find_by(name: 'texas_2').id}")
    expect(page).to_not have_link('vail_3', href: trip_path("#{Trip.find_by(name: 'vail_3').id}")
    expect(page).to_not have_link('cabo_2', href: trip_path("#{Trip.find_by(name: 'cabo_2').id}")
    expect(page).to_not have_link('seattle_1', href: trip_path("#{Trip.find_by(name: 'seattle_1').id}")
    expect(page).to have_link('Ordered', href: admin_dashboard_path)
    expect(page).to have_link('Paid', href: admin_dashboard_path)
    expect(page).to have_link('Completed', href: admin_dashboard_path)

    visit admin_dashboard_path
    click_on "Completed"

    expect(page).to have_link('seattle_1', href: trip_path("#{Trip.find_by(name: 'seattle_1').id}")
    expect(page).to have_link('seattle_2', href: trip_path("#{Trip.find_by(name: 'seattle_2').id}")
    expect(page).to_not have_link('vail_1', href: trip_path("#{Trip.find_by(name: 'vail_1').id}")
    expect(page).to_not have_link('cabo_2', href: trip_path("#{Trip.find_by(name: 'cabo_2').id}")
    expect(page).to_not have_link('texas_3', href: trip_path("#{Trip.find_by(name: 'texas_3').id}")
    expect(page).to have_link('Cancelled', href: admin_dashboard_path)
    expect(page).to have_link('Paid', href: admin_dashboard_path)
    expect(page).to have_link('Cancelled', href: admin_dashboard_path)
  end
end
