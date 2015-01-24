class Group < ActiveRecord::Base
  include Sluggable

  has_many :memberships
  # belongs_to :user
  has_many :users, through: :memberships
  has_many :events

  validates :name, presence: true

  sluggable_column :name

  after_save :set_membership

  private

    def set_membership
      Membership.create!(user_id: self.user_id, group_id: self.id)
    end
end
