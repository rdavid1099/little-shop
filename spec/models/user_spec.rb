require 'rails_helper'


RSpec.describe User, type: :model do
  it "can be created with proper params" do
    user = User.new(username: "user", password: "password")

    expect(user).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
