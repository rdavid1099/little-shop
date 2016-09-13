require 'rails_helper'

RSpec.feature 'Visitor can browse' do
  scenario 'trips by Category' do
    category_1 = create_category('Beaches')
    category_2 = create_category('Mountains')

    category_1.trips.create(title: 'Bermuda',
                            description: 'description',
                            price: '199.99',
                            image: 'image.jpg')

    category_1.trips.create(title: 'Cabo',
                            description: 'description',
                            price: '199.99',
                            image: 'image.jpg')

    category_2.trips.create(title: 'Vail',
                            description: 'description',
                            price: '199.99',
                            image: 'image.jpg')

    category_2.trips.create(title: 'Whistler',
                            description: 'description',
                            price: '199.99',
                            image: 'image.jpg')

    visit category_path(category_1.title)

    expect(page).to have_content('Bermuda')
    expect(page).to have_content('Cabo')
    expect(page).to_not have_content('Vail')
    expect(page).to_not have_content('Whistler')

    visit category_path(category_2.title)

    expect(page).to_not have_content('Bermuda')
    expect(page).to_not have_content('Cabo')
    expect(page).to have_content('Vail')
    expect(page).to have_content('Whistler')
  end
end
