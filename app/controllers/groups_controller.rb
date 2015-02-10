class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :first_group, :new, :create]
  before_action :authenticate_user!
  before_action :require_creator, only: [:edit, :update, :destroy]

  respond_to :html

  def add_user_to_group
    
    @membership = Membership.new
    @membership[:user_id] = current_user.id
    @membership[:group_id] = @group.id
    if Membership.where(group_id: @group.id, user_id: current_user.id).count <= 0
      @membership.save
      MembershipRole.new(membership_id: @membership.id, role: 0).save!
      respond_with(@membership) do |format|
        format.html { redirect_to user_dashboard_path(current_user), notice: "You have been added to #{@group.name}" }
      end
      GroupMailer.group_join_email(@group, current_user).deliver
    else
      redirect_to user_dashboard_path(current_user), notice: "You are already a member of #{@group.name}"
    end
  end

  def remove_user_from_group
    membership = current_user.memberships.find_by_group_id(@group.id)
    roles = membership.membership_roles
    roles.delete_all
    membership.destroy
    current_user.save!
    redirect_to user_dashboard_path(current_user), notice: "You are no longer a member of #{@group.name}."
  end

  def group_events
    @events = @group.events.all
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
    @group ||= Group.find_by slug: params[:id]
    respond_with(@group)
  end

  def popular_groups
    @groups = Group.all.sort { |a,b| b.memberships.count <=> a.memberships.count }
  end

  # def index
  #   @groups = Group.all
  #   respond_with(@groups)
  # end

  def show
    @upcoming_events = @group.upcoming_events.sort_by &:starts_at
    @past_events = @group.past_events.sort_by(&:starts_at).reverse
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
    if Group.find_by(name: @group.name).present?
      flash.now[:danger] = "That group name has already been taken."
      render 'new'
    else
      @group.save
      GroupMailer.group_create_email(@group, current_user).deliver
      respond_with(@group) do |format|
        format.html { redirect_to group_dashboard_path(@group) }
      end
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

    def require_creator
      access_denied unless user_signed_in? && (current_user.id == @group.user_id)
    end

    def set_group
      @group = Group.find_by slug: params[:id]
    end

    def group_params
      params.require(:group).permit(:name, :description, :user_id)
    end
    
end
