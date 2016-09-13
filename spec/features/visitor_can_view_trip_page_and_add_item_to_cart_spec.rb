require 'rails_helper'

RSpec.feature "Visitor can view trip page and add item to cart" do
  scenario "trip page shows info about trip and allows visitor to buy trip" do
    make_trip("Bermuda")
    trip = Trip.last
    visit trip_path(trip)
    click_on "Add to Cart"

    expect(page).to have_content("Cart Items")
    expect(page).to have_content("Bermuda - $199.99")
    expect(page).to have_content("Total: $199.99")
  end
end

# As a visitor
# When I visit any page with an item on it
# I should see a link or button for "Add to Cart"
# When I click "Add to cart" for that item
# And I click a link or button to view cart
# And my current path should be "/cart"
# And I should see a small image, title, description and price for the item I just added
# And there should be a "total" price for the cart that should be the sum of all items in the cart
