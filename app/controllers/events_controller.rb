class EventsController < ApplicationController
  before_action :authenticate, only: %i[create new]

  def new
    @event = Event.new
  end

  def create
  end

  def index
  end

  def show
  end

end
