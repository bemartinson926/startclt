class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :group_dashboard, :edit, :update, :destroy, :group_invite, :group_members, :group_events]
  before_action :authenticate_user!

  respond_to :html

  def group_events
    @events = @group.events
  end

  def group_members
  end

  def group_invite
  end
  
  def first_group
    @group = Group.new
    respond_with(@group)
  end

  def group_dashboard
    respond_with(@group)
  end
  
  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group[:user_id] = current_user.id
    @group.save
    respond_with(@group) do |format|
      format.html { redirect_to group_dashboard_path(@group) }
    end
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
    def set_group
      @group = Group.find_by slug: params[:event_id]
    end

    

    def group_params
      params.require(:group).permit(:name, :description, :user_id)
    end
end
