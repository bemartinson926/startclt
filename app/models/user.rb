class User < ActiveRecord::Base
  include Sluggable

  sluggable_column :email

  before_validation :prep_email
  before_save :create_avatar_url

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :rsvps
  has_many :events, through: :rsvps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def organizer?(group)
    membership = group.memberships.find_by(user_id: self.id)
    membership.membership_roles.each do |r|
      return true if r.role == "organizer"
    end
    false
  end

  def organizer_groups
    self.groups.reject { |group| !self.organizer?(group) }
  end

  def upcoming_group_events
    events = Event.from_group(self.groups).upcoming.most_recent
    events = events.reject { |event| self.events.include? event }
  end

  def user_membership_role_at_group_join(group, user)
    membership = group.memberships.find_by(user_id: user.id)
    return membership_role = membership.membership_roles.first.role
  end

  def role(group)
    membership = group.memberships.find_by(user_id: self.id)
    membership.membership_roles.first.role
  end
  
	private
  	def prep_email
  		self.email = self.email.strip.downcase if self.email
  	end

  	def create_avatar_url
  		self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  	end
end
