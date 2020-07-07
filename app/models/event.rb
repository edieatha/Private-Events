class Event < ApplicationRecord
    belongs_to :creator,  class_name: 'User'
    has_many :created_events, foreign_key: :created_event_id
    has_many :attendees, through: :created_events, source: :event_creator
end
