class ItemsController < ApplicationController

  before_action :move_to_sign_in, only: [:new]
  layout 'user_application', only: :new

  def index
  end

  def new
    @item = Item.new
    10.times do 
      @item.images.build
    end
    @parent_categories = Category.where(parent_id: 0)
  end

  def create
    @item = Item.new(item_params)
    @item.save!
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def show
  end

  private
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    size_cloth = params.require(:item).permit(:size_cloth)[:size_cloth]
    size_shoe = params.require(:item).permit(:size_shoe)[:size_shoe]
    if size_cloth == "unanswered" && size_shoe == "unanswered"
      size = "unanswered"
    elsif size_cloth == "unanswered"
      size = size_shoe
    elsif size_shoe == "unanswered"
      size = size_cloth
    end
    shipping_method_seller_cost = params.require(:item).permit(:shipping_method_seller_cost)[:shipping_method_seller_cost]
    shipping_method_buyer_cost = params.require(:item).permit(:shipping_method_buyer_cost)[:shipping_method_buyer_cost]
    if shipping_method_seller_cost == "" && shipping_method_buyer_cost == ""
      shipping_method = ""
    elsif shipping_method_seller_cost == ""
      shipping_method = shipping_method_buyer_cost
    elsif shipping_method_buyer_cost == ""
      shipping_method = shipping_method_seller_cost
    end
    params.require(:item).permit(:name, :description, :brand, :category_id, :price, :postage, :region, :shipping_date, :condition, images_attributes: [:image]).merge(saler: current_user, size: size, shipping_method: shipping_method)
  end
end
