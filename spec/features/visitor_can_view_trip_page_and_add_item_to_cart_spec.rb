RSpec.feature 'Visitor can view trip page and add item to cart' do
  context 'add one item to cart' do
    scenario 'trip page shows info about trip and allows visitor to buy trip' do
      make_trip('Bermuda')
      trip = Trip.last
      visit trip_path(trip)
      click_on 'Add to Cart'

      expect(page).to have_content('Shopping Cart')
      expect(page).to have_content('Cart: 1')
      expect(page).to have_content('1 Bermuda')
      expect(page).to have_content('$199.99')
      expect(page).to have_content('Total:')
      expect(page).to have_content('$199.99')
    end
  end

  context 'add two items to cart' do
    scenario 'trip page shows info about trip and allows visitor to buy trip' do
      make_trip('Bermuda')
      trip = Trip.last
      visit trip_path(trip)
      click_on 'Add to Cart'
      visit trip_path(trip)
      click_on 'Add to Cart'

      expect(page).to have_content('Cart Items')
      expect(page).to have_content('Cart: 2')
      expect(page).to have_content('2 Bermuda')
      expect(page).to have_content('$399.98')
      expect(page).to have_content('Total:')
      expect(page).to have_content('$399.98')
    end
  end
end
