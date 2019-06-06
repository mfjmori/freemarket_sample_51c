class UsersController < ApplicationController
    layout 'user_application', except: :show
    def index
    end
    def show
    end
    def new
    end
    def create
    end
    def edit
    end
    def update
    end
    def destroy
    end
    def show
    end
    def cardadd
    end
    def cardappend
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
