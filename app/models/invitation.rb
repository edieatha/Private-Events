class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
  scope :past_events, -> { where(:past_events => DateTime.now) }
  scope :upcoming_events, -> { where(:upcoming_events => DateTime.now) }
end
