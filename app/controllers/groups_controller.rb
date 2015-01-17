class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :group_dashboard, :edit, :update, :destroy]

  respond_to :html
  
  def new_group
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
    @group.save
    respond_with(@group)
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
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :description)
    end
end
