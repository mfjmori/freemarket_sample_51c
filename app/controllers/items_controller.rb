class ItemsController < ApplicationController
  

  before_action :move_to_sign_in, only: [:new]
  layout 'user_application', only: :new
  
    def index
        @items = Item.all
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
    if @item.save
      redirect_to action: 'index'
    else
      @parent_categories = Category.where(parent_id: 0)
      redirect_to action: 'new'
    end
  end

  def show
    @items = Item.find(params[:id])
    @users = @items.saler
    # @image = Image.find(params[:id])


    @groundchild = Category.find(@items.category_id)
    @child = Category.find(@groundchild.parent_id)
    @theparent = Category.find(@child.parent_id)
  end
  private
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :category_id, :price, :postage, :shipping_method, :region, :shipping_date, :condition, images_attributes: [:image]).merge(saler: current_user)
  end
end

