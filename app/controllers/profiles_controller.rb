class ProfilesController < ApplicationController

  before_action :set_card
  def show
    @users = User.find(params[:user_id])
  end
  def edit
    @users = User.find_by(params[:id])
  end
  private

  def set_card
    @user = User.find(params[:user_id])
  end
end
