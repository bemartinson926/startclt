class InvitesController < ApplicationController
  respond_to :html

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    @group = Group.find_by(params[:group_id])
    InviteMailer.invite_email(@group, current_user, @invite).deliver
    respond_with(@invite) do |format|
      format.html { redirect_to group_dashboard_path(@group) }
    end
  end

  private
    def invite_params
      params.require(:invite).permit(:name, :email, :message, :group_id)
    end
end