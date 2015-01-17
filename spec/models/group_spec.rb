require 'rails_helper'

RSpec.describe Group, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:group) }
    it { is_expected.to be_valid }
  end

  context "invalid group" do
    subject { FactoryGirl.build(:group, name: nil) }
    it { is_expected.to be_invalid }
  end

  context "associations" do
    it { is_expected.to have_many(:memberships) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:events) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
