RSpec.feature 'Visitor can' do
  scenario 'remove trip from cart' do
    trip = make_trip("bermuda")
    visit trip_path(trip)
    click_on 'Add to Cart'

    visit '/cart'

    click_on 'Remove'
    expect(page).to have_content('Shopping Cart')
    save_and_open_page
    within('div#alert alert-success') do
      expect(page).to have_content("Successfully removed #{trip.title} from your cart")
      expect(page).to have_link(trip.title, href: trip_path)
      expect(div[:style]).to match(/color: green/)
    end
    # it { should have_css('div.flash_remove', :color => green) }
    expect(page).to_not have_content("#{trip.title}")
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart
  end
end
