class UsersController < ApplicationController
  before_action :set_user, except: [:user_dashboard]
  
  def user_dashboard
  	@user = User.find(params[:id])
  end

  def user_groups
  end

  def user_events
  end

  def user_profile
  end

  def show
  end

  private

  def set_user
    @user = User.find_by slug: params[:id]
  end
end