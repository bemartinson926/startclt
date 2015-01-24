class EventsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  

  respond_to :html

  def index
    @events = @group.events.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_group
      @group = Group.find_by slug: params[:id]
    end

    def set_event
      @event = Event.find_by slug: params[:id]
    end

    def event_params
      params.require(:event).permit(:group_id, :name, :description, :location, :starts_at, :ends_at)
    end
end
