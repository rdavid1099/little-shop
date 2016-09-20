require 'rails_helper'

RSpec.feature 'admin can create trips' do
  scenario 'it fills in title, descript, and price to create trip' do
    
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
