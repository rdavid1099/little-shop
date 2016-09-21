require 'rails_helper'

RSpec.feature 'Logged in user can logout' do
  scenario 'when user clicks logout they are logged out' do
    user = make_user('test')
    visit trips_path
    click_on 'Login'
    fill_in 'sessions_username', with: 'test_test'
    fill_in 'sessions_password', with: 'testing'
    click_on 'Log In'
    click_on 'Logout'
    expect(page).to have_content('Login')
    expect(page).to_not have_content('Logout')
  end
end
