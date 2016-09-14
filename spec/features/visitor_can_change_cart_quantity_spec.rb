RSpec.feature 'Visitor who has items in cart' do
  scenario 'can increase the cart quantity' do
    trip = make_trip('Bermuda')
    visit trip_path(trip)
    click_on 'Add to Cart'

    visit '/cart'

    expect(page).to have_content('1 - Bermuda - $199.99')

    click_on 'Edit Quantity'
    fill_in 'Quantity', with: '2'
    click_on 'Update Quantity'

    expect(page).to have_content('2 - Bermuda - $399.98')
    expect(page).to have_content('Total: $399.98')
  end

  scenario 'can decrease the cart quantity' do
    trip = make_trip('Bermuda')
    visit trip_path(trip)
    click_on 'Add to Cart'

    visit '/cart'

<<<<<<< HEAD
    click_on "Edit Quantity"
    fill_in "Quantity", with: "2"
    click_on "Update Quantity"
=======
    click_on 'Edit Quantity'
    fill_in 'Quantity', with: '2'
    click_on 'Update Quantity'
>>>>>>> 2d0f631d885fc48574043b45ec78cd1c3fae960e

    expect(page).to have_content('2 - Bermuda - $399.98')
    expect(page).to have_content('Total: $399.98')

<<<<<<< HEAD
    click_on "Edit Quantity"
    fill_in "Quantity", with: "1"
    click_on "Update Quantity"
=======
    click_on 'Edit Quantity'
    fill_in 'Quantity', with: '1'
    click_on 'Update Quantity'
>>>>>>> 2d0f631d885fc48574043b45ec78cd1c3fae960e

    expect(page).to have_content('1 - Bermuda - $199.99')
    expect(page).to have_content('Total: $199.99')
  end
end
