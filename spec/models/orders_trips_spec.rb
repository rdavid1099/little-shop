RSpec.describe OrdersTrip, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:trip) }
    it { is_expected.to belong_to(:order) }
    it { is_expected.to validate_presence_of(:quantity) }
  end
end
