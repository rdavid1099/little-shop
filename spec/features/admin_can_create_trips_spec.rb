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

      expect(page).to have_content('Test Title')
      expect(page).to have_content('Test Description')
      expect(page).to have_content('Price: $1.99')
      expect(page).to have_xpath("//img[@src=\"/images/medium/default-trip-img.jpg\"]")
    end
  end
end

# As an authenticated Admin:
# I can create an item.
# - An item must have a title, description and price.
# - An item must belong to at least one category.
# - The title and description cannot be empty.
# - The title must be unique for all items in the system.
# - The price must be a valid decimal numeric value and greater than zero.
# - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
