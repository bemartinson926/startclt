class Group < ActiveRecord::Base
  include Sluggable

  has_many :memberships
  # belongs_to :user
  has_many :users, through: :memberships
  has_many :events

  validates :name, presence: true, uniqueness: true

  sluggable_column :name

  after_save :set_membership

  def upcoming_events
    Event.from_group(self).upcoming.most_recent
    # self.events.reject { |event| event.in_past? }
  end

  def past_events
    # Event.from_group(self).most_recent.reverse
    self.events.reject { |event| !event.in_past? }
  end

  private

    def set_membership
      @membership = Membership.create!(user_id: self.user_id, group_id: self.id)
      set_organizer_membership_role(@membership)
    end

    def set_organizer_membership_role(membership)
      @role = MembershipRole.new(membership_id: membership.id, role: 1)
      @role.save!
    end    
end
