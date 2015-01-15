require 'rails_helper'

RSpec.describe User, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:user) }
    it { is_expected.to be_valid }
  end

  context "invalid user" do
    subject { FactoryGirl.build(:user, email: nil) }
    it { is_expected.to be_invalid }
  end

  context "associations" do
    it { is_expected.to have_many(:memberships) }
    it { is_expected.to have_many(:groups) }
    it { is_expected.to have_many(:rsvps) }
    it { is_expected.to have_many(:events) }
  end
end
