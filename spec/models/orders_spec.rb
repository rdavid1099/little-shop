RSpec.describe Order, type: :model do
  it 'it can be created with proper params' do
    order1 = Order.new(status: 'paid')
    order2 = Order.new(status: 'ordered')
    order3 = Order.new(status: 'cancelled')
    order4 = Order.new(status: 'completed')

    expect(order1).to be_valid
    expect(order2).to be_valid
    expect(order3).to be_valid
    expect(order4).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to have_many(:trips) }
    it { is_expected.to have_many(:orders_trips) }
  end
end
