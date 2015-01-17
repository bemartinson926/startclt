class User < ActiveRecord::Base
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

	private
  	def prep_email
  		self.email = self.email.strip.downcase if self.email
  	end

  	def create_avatar_url
  		self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  	end
end
