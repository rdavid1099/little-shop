RSpec.feature 'Visitor can view' do
  scenario 'trips on the trips index' do
    make_trip('Bermuda')
    make_trip('Florida')

    visit trips_path

    expect(page).to have_content('Bermuda')
    expect(page).to have_content('Florida')
  end
end
