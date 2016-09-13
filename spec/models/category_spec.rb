require 'rails_helper'


RSpec.describe Category, type: :model do
  it "can be created with proper params" do
    category = Category.new(title: "title")

    expect(category).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
