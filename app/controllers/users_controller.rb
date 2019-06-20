class UsersController < ApplicationController

    require "payjp"
    layout 'user_application', except: [:show, :logout]
    before_action :move_to_sign_in, only: [:show, :card, :pay]
    def index
    end
    def show
        redirect_to new_user_session_path unless user_signed_in?
        redirect_to user_path(current_user) if current_user.id != params[:id].to_i
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
        @user = User.find(params[:id])
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
        @user = current_user
    end
    def pay
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        if params['payjp-token'].blank?
            redirect_to action: "card"
        else
            customer = Payjp::Customer.create(card: params['payjp-token']) 
            @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
            if @card.save
                redirect_to action: "complete"
            else
                redirect_to action: "pay"
            end
        end
    end
    def complete
        @user = User.new
    end

    private
    def move_to_sign_in
        redirect_to new_user_session_path unless user_signed_in?
    end
    
end
