class UsersController < ApplicationController

    require "payjp"
    layout 'user_application', except: [:show, :logout]
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

    end
    def pay
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        
        binding.pry
        
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
    
end
