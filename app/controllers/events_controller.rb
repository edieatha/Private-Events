class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
         @events = current_user.event.build
    end

    def create
        @event = current_user.events.build(event_params)
    end

    def event_params
        params.require(:event).permit(:content)
    end
end
