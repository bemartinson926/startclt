class Group < ActiveRecord::Base
  include Sluggable

  has_many :memberships
  has_many :users, through: :memberships
  has_many :events

  validates :name, presence: true

  sluggable_column :name
end
