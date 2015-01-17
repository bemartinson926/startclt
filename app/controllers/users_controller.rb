class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :user_dashboard, :edit, :update, :destroy]
  
  def user_dashboard
  	@user = User.find(params[:id])
  end

  def show
  end


end