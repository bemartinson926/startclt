class Event < ActiveRecord::Base
  include Sluggable
  sluggable_column :name

  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps

  validates :name, presence: true

  # true, false
  def in_past?
    starts_at < Time.now 
  end
  
  def self.from_group(group)
    where(group: group)
  end
  
  def self.upcoming(reference = Time.now)
    where("starts_at > ?", reference)
  end
  
  def self.most_recent
    order('starts_at ASC, created_at ASC')
  end
end
