require 'rails_helper'

RSpec.feature 'Admin cannot modify other users' do
  scenario 'logged in admin can modify own account data' do
    admin = make_admin('franklin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    click_on 'Account Settings'
    fill_in 'user_username', with: 'New Username'
    click_on 'Update Account'

    expect(page).to have_content('New Username')
    expect(page).to_not have_content('franklin_test')
  end

  scenario 'logged in admin cannot modify other users account data' do
    admin = make_admin('admin')
    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    user = make_user('johnny')

    visit edit_user_path(user)

    expect(page).to have_content('404')

    visit dashboard_path

    expect(page).to have_content('404')
  end
end
