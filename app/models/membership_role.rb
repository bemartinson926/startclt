class MembershipRole < ActiveRecord::Base
  belongs_to :membership

  enum role: [:member, :organizer]
end
