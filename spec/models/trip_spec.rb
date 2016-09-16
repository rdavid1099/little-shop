RSpec.describe Trip, type: :model do
  it 'can be created with proper params' do
    trip = Trip.new(title: 'title',
                    description: 'description',
                    price: 'price',
                    image: 'image')

    expect(trip).to be_valid
  end

  it 'and status is created by default' do
    trip = Trip.create(title: 'title',
                    description: 'description',
                    price: 'price',
                    image: 'image')

    expect(trip.status).to eq('active')
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
