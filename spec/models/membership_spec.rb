require 'rails_helper'

RSpec.describe Membership, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:membership) }
    it { is_expected.to be_valid }
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group) }
    it { is_expected.to have_many(:membership_roles) }
  end
end
