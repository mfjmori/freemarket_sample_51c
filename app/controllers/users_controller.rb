class UsersController < ApplicationController
    layout 'user_application', except: :show
    def index
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user=User.new
    end
    def create
        user = User.new(user_params)
        user.save
    end
    def edit
    end
    def update
    end
    def destroy
    end

    def logout
    end
    def address
        @user = User.new
        # render "telephone"
    end
    def telephone
        @user = User.new
        # render "card"
    end
    def card
        @user = User.new
        # render "complete"
    end
    def complete
        @user = User.new
    end
end
