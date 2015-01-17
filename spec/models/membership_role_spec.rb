require 'rails_helper'

RSpec.describe MembershipRole, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:membership_role) }
    it { is_expected.to be_valid }
  end

  context "role defaults to member" do
    let(:member_role) { FactoryGirl.build(:membership_role) }
    it "" do
      expect(member_role.role).to eq("member")
    end
  end

  context "associations" do
    it { is_expected.to belong_to(:membership) }
  end
end
