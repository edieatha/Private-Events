class Event < ApplicationRecord
<<<<<<< HEAD
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :event_attendees, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendees, source: :event_attendee
 
=======
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :invitations, source: :attendee
  has_many :invitations, foreign_key: 'attended_event_id'
>>>>>>> e9a8631ddc080552622acff5a869b6af5fbd5ef8

  validates :description, presence: true
end
