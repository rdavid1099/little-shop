require 'rails_helper'

RSpec.feature 'admin cannot modify other users' do
  scenario 'logged in admin can modify own account data' do
    admin = make_admin('admin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_dashboard_path
    click_on 'Account Settings'
    fill_in 'user_username', with: "New Username"
    click_on 'Update Account'
  end

  # scenario 'logged in admin cannot modify other users account data' do
  #   admin = make_admin('admin')
  #   ApplicationController.any_instance.stubs(:logged_in?).returns(true)
  #   ApplicationController.any_instance.stubs(:current_user).returns(admin)
  #
  # end
end
# As a logged in Admin
# I can modify my account data
# But I cannot modify any other user's account data
