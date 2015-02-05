class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  
  def user_dashboard
  end

  def user_groups
  end

  def user_events
  end

  # def user_profile
  # end

  def show
    render 'user_profile'
  end

  private

  def set_user
    @user = User.find_by slug: params[:id]
  end
end