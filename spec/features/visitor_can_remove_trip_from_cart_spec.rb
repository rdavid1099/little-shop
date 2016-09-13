RSpec.feature "Visitor can" do
  scenario "remove trip from cart" do
skip
    visit '/cart'

    click_on "Remove"

#
# And I click link "Remove"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart
  end
end
