RSpec.describe User, type: :model do
  it 'can be created with proper params' do
    user = User.new(name: 'test',
                    email: 'test@test.com',
                    username: 'user',
                    password: 'password')

    expect(user).to be_valid
  end

  it 'can be created with proper params' do
    user = User.create(name: 'test',
                       email: 'test@test.com',
                       username: 'user',
                       password: 'password')

    expect(user).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_many(:orders) }
  end
end
