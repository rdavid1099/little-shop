require 'rails_helper'

RSpec.feature 'User can create account' do
  context 'with proper params' do
    scenario 'a visitor can enter valid information and create account' do
      visit login_path
      click_on 'Create Account'
      fill_in 'user_name', with: 'Test Tester'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_username', with: 'test'
      fill_in 'user_password', with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq(dashboard_path)
      within('div.wrapper_top_nav') do
        expect(page).to have_content('Logged in as test')
        expect(page).to_not have_content('Login')
        expect(page).to have_content('Logout')
      end
      within('div.dashboard') do
        expect(page).to have_content('Name: Test Tester')
        expect(page).to have_content('Email: test@test.com')
        expect(page).to have_content('Username: test')
      end
    end
  end

  context 'wthout proper params' do
    scenario 'a visitor cannot create account without all params' do
      visit login_path
      click_on 'Create Account'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_username', with: 'test'
      fill_in 'user_password', with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq(users_path)
      within('div.wrapper_top_nav') do
        expect(page).to have_content('Login')
        expect(page).to have_content('Sign Up')
      end
      expect(page).to have_content("Name can't be blank")
    end
  end
end
