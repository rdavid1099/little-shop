require 'rails_helper'

RSpec.feature "user can login" do
  context 'with proper params' do
    scenario 'an existing user can login to account and see different navbar' do
      user = make_user('test')
      visit trips_path
      click_on 'Login'
      fill_in 'sessions_username', with: 'test_test'
      fill_in 'sessions_password', with: 'testing'
      click_on 'Log In'

      expect(current_path).to eq(dashboard_path)
      within('div.navbar') do
        expect(page).to have_content('Logged in as test')
        expect(page).to_not have_content('Login')
        expect(page).to have_content('Logout')
      end
    end
  end
end
