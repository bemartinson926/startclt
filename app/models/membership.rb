class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :membership_roles
end
