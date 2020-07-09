class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      # flash.notice = 'Event Created'
      redirect_to events_path
    else
      render 'new'
    end
  end
  def attend
    @event = Event.find(params[:event_id])
    @event.event_attendees.new(event_attendee_id: current_user.id,attended_event_id: params[:event_id])
    
    @event.save
    
    redirect_to events_path(params[:id])
  end
  def show
    @event = Event.find(params[:id])
    @attendees = @event.event_attendees
  end
  
  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
  
  
end
