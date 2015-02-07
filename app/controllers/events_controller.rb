class EventsController < ApplicationController
  before_action :set_models, only: [:index, :destroy, :group_events, :add_rsvp_to_event]

  respond_to :html

  def add_rsvp_to_event
    @group = Group.find_by slug: params[:id]
    event_id = params[:rsvp_event_id]
    event_name = params[:event_name]
    @rsvp = Rsvp.new
    @rsvp[:user_id] = current_user.id
    @rsvp[:event_id] = event_id
    if Rsvp.where(event_id: event_id, user_id: current_user.id).count <= 0
      @rsvp.save
      respond_with(@rsvp) do |format|
        format.html { redirect_to user_dashboard_path(current_user), notice: "You have RSVP'd to #{event_name}." }
      end
    else
      redirect_to user_dashboard_path(current_user), notice: "You have already RSVP'd to #{event_name}."
    end
  end

  def index
    @events = @group.events.all
    respond_with(@events)
  end

  def show
    @group = Group.find_by slug: params[:group_id]
    @event = Event.find_by slug: params[:id]
    respond_with(@event)
  end

  def new
    @group = Group.find_by(slug: params[:group_id])
    @event = Event.new(group: @group)
    respond_with(@event)
  end

  def edit
    @group = Group.find_by slug: params[:group_id]
    @event = Event.find_by slug: params[:id]
  end

  def create
    @group = Group.find_by(slug: params[:group_id])
    @event = Event.new(event_params)
    @event.group_id = @group.id
    binding.pry
    @event.save
    # respond_with(@event)
    redirect_to @group, notice: "New event successfully created."
  end

  def update
    @event = Event.find_by slug: params[:id]
    @group = Group.find_by slug: params[:group_id]
    @event.update(event_params)
    redirect_to group_dashboard_path(@group), notice: "Event information successfully updated."
    # respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  # def group_events
  #   @events = @group.events.all
  # end

  private
    def set_models
      set_group
      set_event
    end

    def set_group
      @group = Group.find_by slug: params[:id]
    end

    def set_event
      @event = Event.find_by slug: params[:id]
    end

    def event_params
      params.require(:event).permit(:group_id, :name, :description, :location, :starts_at, :ends_at)
    end

    # def rsvp_params
    #   params.require(:rsvp).permit(:event_id, :user_id)
    # end
end
