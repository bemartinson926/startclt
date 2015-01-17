require 'rails_helper'

RSpec.describe Event, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:event) }
    it { is_expected.to be_valid }
  end

  context "invalid event" do
    subject { FactoryGirl.build(:event, name: nil) }
    it { is_expected.to be_invalid }
  end

  context "associations" do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to have_many(:rsvps) }
    it { is_expected.to have_many(:users) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
