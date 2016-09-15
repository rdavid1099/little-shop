RSpec.describe Trip, type: :model do
  it 'it can be created with the proper params' do
    trip = Trip.new(title: 'title', description: 'description', price: 'price', image: 'image')

    expect(trip).to be_valid
  end

  context 'validations' do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:orders_trips) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
