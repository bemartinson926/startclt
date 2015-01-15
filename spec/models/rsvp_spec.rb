require 'rails_helper'

RSpec.describe Rsvp, :type => :model do
  context "has a valid factory" do
    subject { FactoryGirl.build(:rsvp) }
    it { is_expected.to be_valid }
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:event) }
  end
end
