require 'rails_helper'

RSpec.feature 'Admin can log in' do
  scenario 'and is redirected to the admin dashboard' do
    admin = make_admin('admin')

    visit login_path
    fill_in 'sessions_username', with: 'admin'
    fill_in 'sessions_password', with: 'password'
    click_on 'Log In'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('No Refunds Travel Admin Dashboard')
  end
end
