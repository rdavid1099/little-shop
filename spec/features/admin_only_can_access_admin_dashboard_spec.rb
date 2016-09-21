require 'rails_helper'

RSpec.feature 'Only admin can access admin dashboard' do
  scenario 'logged in admin can access dashboard' do
    admin = make_admin('admin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('No Refunds Travel Admin Dashboard')
  end

  scenario 'logged in user cannot access admin dashboard' do
    user = make_user('user')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('404')
  end

  scenario 'visitor cannot access admin dashboard' do

    visit admin_dashboard_path

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('404')
  end
end
