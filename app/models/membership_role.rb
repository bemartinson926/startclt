class MembershipRole < ActiveRecord::Base
  belongs_to :memberships

  enum role: [:member, :organizer]
end
