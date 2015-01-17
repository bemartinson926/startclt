class Event < ActiveRecord::Base
  include Sluggable

  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps

  validates :name, presence: true

  sluggable_column :name
end
