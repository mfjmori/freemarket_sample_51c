class AddressesController < ApplicationController
  before_action :set_current_user
  def new
    @addresses=Address.new
    render action: :new, layout: "user_application"
  end

  def create
    address=Address.new(address_params)
    if address.save
      redirect_to complete_users_path
    else
    render :action => 'new' 
  end
  end
  def show
    @addresses=Address.find(params[:id])
  end
    def edit
    end
    private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    @user = User.find(params[:user_id])
  end
  def address_params
    params.require(:address).permit(:post_code,:prefecture,:municipality,:house_number,:phone_number,:building_name).merge(user_id: current_user.id)
  end
end
