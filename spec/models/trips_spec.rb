RSpec.describe Trip, type: :model do
  it 'can be created with the proper params' do
    trip = Trip.new(title: 'title', description: 'description', price: 1)

    expect(trip).to be_valid
  end

  it 'status is created by default' do
    trip = Trip.create(title: 'title',
                       description: 'description',
                       price: 1)

    expect(trip.status).to eq('active')
  end

  context 'validations' do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:orders_trips) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
