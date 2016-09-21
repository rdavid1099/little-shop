require 'rails_helper'

RSpec.feature 'User can edit account data' do
  scenario 'logged in user can view and edit account data' do
    user = make_user('jimmy')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit dashboard_path
    click_on 'Account Settings'
    fill_in 'user_username', with: "New Username"
    click_on 'Update Account'

    expect(page).to have_content('New Username')
    expect(page).to_not have_content('jimmy_test')
  end
end
