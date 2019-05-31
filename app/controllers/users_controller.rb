class UsersController < ApplicationController
    before_action :require_signin, except: :index
    def index
        @user = User.new
    end
    def new
      case params[:url]
      when "registration" then
      @email =session["devise.facebook_data"]["info"]["email"] if session["devise.facabook_data"]
      @email =session["devise.google_data"]["extra"]["id_info"]["eamil"]

        render
      else
        @error_message=session[:error_message]
        reset_session
        session[:state]="registration"
      end



    end
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_steps_path
        else
          render :new
        end
      end
    def edit
    end
    def update
    end
    def destroy
    end
    def show
    end
end
