class Event < ActiveRecord::Base
  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps

  validates :name, presence: true
end
