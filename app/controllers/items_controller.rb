class ItemsController < ApplicationController

  include CommonActions
  before_action :set_item, only: [:show, :destroy, :edit, :update, :stop]
    before_action :move_to_sign_in, only: [:new, :edit, :destroy, :stop]
  layout 'item_application', only: [:new, :edit]
  
    def index
      @items = Item.all.where.not(status: true)
      
      @items_lady =  @items.item_num(ladies_category)
      
      @items_men =  @items.item_num(mens_category)
      
      @items_baby =  @items.item_num(baby_category)
      
      @items_cosme =  @items.item_num(cosmes_category)

      @items_Chanel = @items.item_brand("シャネル")

      @items_Louis_Vuitton = @items.item_brand("ルイヴィトン")

      @items_Supream= @items.item_brand("シュプリーム")

      @items_Nike= @items.item_brand("ナイキ")

    end

  

  def new
    @item = Item.new
    10.times do
      @item.images.build
    end
    @parent_categories = Category.where(parent_id: 0)
    @child_categories, @grandchild_categories = [], []
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to action: 'index'
    else
      @parent_categories = Category.where(parent_id: 0)
      redirect_to action: 'new'
    end
  end

  def edit
    grandchild_category = Category.find(@item.category_id)
    child_category = Category.find(grandchild_category.parent_id)
    parent_category = Category.find(child_category.parent_id)

    @parent_category_id = parent_category.id
    @child_category_id = child_category.id
    @grandchild_category_id = grandchild_category.id

    @grandchild_categories = Category.where(parent_id: child_category.id)
    @child_categories = Category.where(parent_id: parent_category.id)
    @parent_categories = Category.where(parent_id: 0)
    
    @item.images.each do |image|
      image.image.cache!
    end

    empty_drop_zone = 10 - @item.images.length
    empty_drop_zone.times do 
      @item.images.build
    end
  end

  def update
    if @item.update!(item_params)
      redirect_to action: 'index'
    else
      @parent_category_id = Category.find(child_category.parent_id).id
      @child_category_id = Category.find(grandchild_category.parent_id).id
      @grandchild_category_id = Category.find(@item.category_id).id
  
      @grandchild_categories = Category.where(parent_id: child_category.id)
      @child_categories = Category.where(parent_id: parent_category.id)
      @parent_categories = Category.where(parent_id: 0)
      redirect_to action: 'edit'
    end
  end

  def show
    @items = Item.find(params[:id])

    @users = @item.saler
    @groundchild = Category.find(@item.category_id)
    @child = Category.find(@groundchild.parent_id)
    @theparent = Category.find(@child.parent_id)
  end

  def destroy
    if @item.saler_id == current_user.id
      @item.destroy
    end
    redirect_to action: :show
  end

  def stop
    @item.update(status: params[:status])
    redirect_to action: :show
  end

  private
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :category_id, :price, :postage, :shipping_method, :region, :shipping_date, :condition, images_attributes: [:image, :image_cache, :id, :_destroy]).merge(saler: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end

