RSpec.feature 'Visitor can remove trips from cart' do
  scenario 'remove trip from cart' do
    trip = make_trip('bermuda')
    visit trip_path(trip)
    click_on 'Add to Cart'

    click_on 'Remove'
    expect(page).to have_content('Shopping Cart')

    within('div.cart-contents') do
      expect(page).to_not have_content(trip.title.to_s)
    end

    within('div.alert') do
      expect(page).to have_content(
        "Successfully removed #{trip.title} from your cart"
        )
      expect(page).to have_link(trip.title, href: trip_path(trip))
    end
  end
end
