class ProfilesController < ApplicationController
  def show
    @users = User.find_by(params[:id])
  end
  def edit
  end
end
