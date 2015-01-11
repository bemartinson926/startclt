class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  enum is_attending: [:invited, :yes, :no, :maybe]
end
