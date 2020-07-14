class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :invitations, source: :attendee
  has_many :invitations, foreign_key: 'attended_event_id'

  validates :description, presence: true

  scope :past_events, -> { where('date < ?', DateTime.now) }
  scope :upcoming_events, -> { where('date > ?', DateTime.now) }
end