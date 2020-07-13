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
    if @event.invitations.exists?(attendee_id: current_user.id, attended_event_id: params[:event_id])
      flash[:alert] = ' !!! You already signed up for this event !!!'
    else 
      @event.invitations.new(attendee_id: current_user.id, attended_event_id: params[:event_id])

      @event.save
    end

    redirect_to event_path(params[:event_id])
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.invitations
  end

  def event_params
    params.require(:event).permit(:even_name, :description, :location, :date)
  end

  # def already_signed_up
  #   Invitation.exists?(attendee_id: @user, attended_event_id: @event)
  # end

end