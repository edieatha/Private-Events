class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendees, through: :event_attendees, source: :event_attendee
  has_many :event_attendees, foreign_key: 'attended_event_id'

  validates :description, presence: true
end
