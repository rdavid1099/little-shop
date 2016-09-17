require 'rails_helper'

RSpec.feature 'only admin can access admin dashboard' do
  scenario 'logged in admin can access dashboard' do
    make_admin('admin')

    visit login_path
    fill_in 'sessions_username', with: 'admin'
    fill_in 'sessions_password', with: 'password'
    click_on 'Log In'
    visit admin_dashboard_path
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('No Refunds Travel Admin Dashboard')
  end

  scenario 'logged in user cannot access admin dashboard' do
    make_user('user')

    visit login_path
    fill_in 'sessions_username', with: 'user_test'
    fill_in 'sessions_password', with: 'testing'
    click_on 'Log In'
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
