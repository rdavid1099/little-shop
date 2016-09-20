require 'rails_helper'

RSpec.feature 'admin can create trips' do
  context 'with proper params' do
    scenario 'it fills in title, descript, and price to create trip' do
      admin = make_admin('test')
      category = create_category('Category Test')
      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_trip_path

      fill_in 'trip_title', with: 'Test Title'
      fill_in 'trip_description', with: 'Test Description'
      fill_in 'trip_price', with: '1.99'
      find(:css, "#trip_category_ids_[value='#{category.id}']").set(true)
      click_on 'Create Trip'

      expect(page).to have_content('TEST TITLE')
      expect(page).to have_content('Test Description')
      expect(page).to have_content('Price: $1.99')
      expect(page).to have_xpath("//img[@src=\"/images/medium/default-trip-img.jpg\"]")
    end
  end

  context 'admin is redirected' do
    scenario 'when creating trip with inproper params' do
      admin = make_admin('test')
      category = create_category('Category Test')
      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_trip_path

      fill_in 'trip_title', with: ''
      fill_in 'trip_description', with: ''
      fill_in 'trip_price', with: '1.99'
      find(:css, "#trip_category_ids_[value='#{category.id}']").set(true)
      click_on 'Create Trip'

      expect(page).to have_content('Trip did not save')
    end
  end

  context 'admin is redirected' do
    scenario 'when creating trip with no category' do
      admin = make_admin('test')
      category = create_category('Category Test')
      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_trip_path

      fill_in 'trip_title', with: 'Test Title'
      fill_in 'trip_description', with: 'Test Description'
      fill_in 'trip_price', with: '1.99'
      find(:css, "#trip_category_ids_[value='#{category.id}']").set(false)
      click_on 'Create Trip'

      expect(page).to have_content('Trip did not save')
    end
  end

  context 'admin is redirected' do
    scenario 'when creating trip with price below one dollar' do
      admin = make_admin('test')
      category = create_category('Category Test')
      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_trip_path

      fill_in 'trip_title', with: 'Test Title'
      fill_in 'trip_description', with: 'Test Description'
      fill_in 'trip_price', with: '0'
      find(:css, "#trip_category_ids_[value='#{category.id}']").set(true)
      click_on 'Create Trip'

      expect(page).to have_content('Trip did not save')
    end
  end
end
