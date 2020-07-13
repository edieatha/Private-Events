class EventAttendeesController < ApplicationController
  # def attend
  #     @event.event_attendees << current_user
  #     @event.save
  # end
  def index
    @event_attendee = EventAttendee.all
  end

  def new 
  end
end
