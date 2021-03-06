class ItemsController < ApplicationController

  include CommonActions
  before_action :set_item, only: [:show, :destroy, :edit, :update, :stop]
  before_action :move_to_sign_in, only: [:new, :edit, :create, :update, :destroy, :stop]
  layout 'item_application', only: [:new, :edit]
  
    def index

      @items = Item.all.where.not(status: true)
      @items_lady =  @items.item_num(ladies_category)
      @items_lady2 =  @items.item_num2(ladies_category)
      @items_lady3 =  @items.item_num3(ladies_category)

      @items_men =  @items.item_num(mens_category)
      @items_men2 =  @items.item_num2(mens_category)
      @items_men3 =  @items.item_num3(mens_category)

      @items_baby =  @items.item_num(baby_category)
      @items_baby2 =  @items.item_num2(baby_category)
      @items_baby3 =  @items.item_num3(baby_category)

      @items_cosme =  @items.item_num(cosmes_category)
      @items_cosme2 =  @items.item_num2(cosmes_category)
      @items_cosme3 =  @items.item_num3(cosmes_category)

      @items_Chanel = @items.item_brand("シャネル")
      @items_Chanel2 = @items.item_brand2("シャネル")
      @items_Chanel3 = @items.item_brand3("シャネル")

      @items_Louis_Vuitton = @items.item_brand("ルイヴィトン")
      @items_Louis_Vuitton2 = @items.item_brand2("ルイヴィトン")
      @items_Louis_Vuitton3 = @items.item_brand3("ルイヴィトン")

      @items_Supream= @items.item_brand("シュプリーム")
      @items_Supream2= @items.item_brand2("シュプリーム")
      @items_Supream3= @items.item_brand3("シュプリーム")

      @items_Nike= @items.item_brand("ナイキ")
      @items_Nike2= @items.item_brand2("ナイキ")
      @items_Nike3= @items.item_brand3("ナイキ")

    end

  def new
    @item = Item.new
    10.times do
      @item.images.build
    end
    @parent_categories = Category.child_num(0)
    @child_categories, @grandchild_categories = [], []
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      @parent_categories = Category.where(parent_id: 0)
      @child_categories, @grandchild_categories = [], []
      redirect_to action: 'new'
    end
  end

  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    parent_category = child_category.parent

    @item.parent_category_id = parent_category.id
    @item.child_category_id = child_category.id

    @grandchild_categories = child_category.children
    @child_categories = parent_category.children
    @parent_categories = Category.child_num(0)

    @item.images.each do |image|
      image.image.cache!
    end

    empty_drop_zone = 10 - @item.images.length
    empty_drop_zone.times do 
      @item.images.build
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      redirect_to action: 'edit'
    end
  end

  def show
    @items = Item.find(params[:id])
    @slaer_items = Item.where(saler_id: @items.saler.id)

    @users = @item.saler
    @groundchild = Category.find(@item.category_id)
    @child = Category.find(@groundchild.parent_id)
    @theparent = Category.find(@child.parent_id)
  end

  def destroy
    if @item.saler_id == current_user.id
      @item.destroy
    end
    redirect_to action: :index
  end

  def stop
    @item.update(status: params[:status])
    redirect_to action: :show
  end

  def search
    if params[:keyword].present?
      @search = Item.ransack(name_or_description_cont: params[:keyword])
      @items = @search.result.on_sale
    elsif params[:q].present?
      @search = Item.ransack(search_params)
      @items = @search.result.on_sale
      @parent_category_id = params[:q][:parent_category_id]
      @child_category_id = params[:q][:child_category_id]
      @child_categories = Category.child_num(@parent_category_id)
      @grandchild_categories = Category.child_num(@child_category_id)
    end
    params[:q] ||= {sorts: 'id desc'}
    @items ||= Item.on_sale.recent
    @search ||= Item.ransack()
    @parent_categories = Category.child_num(0)
    @parent_category_id ||= ''
    @child_category_id ||= ''
    @child_categories ||= []
    @grandchild_categories ||= []
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

  def search_params
    params.require(:q).permit(:sorts, :name_or_description_cont, :brand_cont, :size_eq, :price_gteq, :price_lteq, { condition_eq_any: [] }, { postage_eq_any: [] }).merge(search_categories_params).merge(buyer_id_params)
  end

  def search_categories_params
    if params[:q][:category_id_eq_any].present?
      grandchild_category_ids = params[:q][:category_id_eq_any]
    elsif params[:q][:child_category_id].present?
      grandchild_category_ids = Category.child_num(params[:q][:child_category_id]).map(&:id)
    elsif params[:q][:parent_category_id].present?
      child_category_ids = Category.child_num(params[:q][:parent_category_id]).map(&:id)
      grandchild_category_ids = Category.child_num(child_category_ids).map(&:id)
    end
    { category_id_eq_any: grandchild_category_ids }
  end

  def buyer_id_params
    if params[:q][:buyer_id_null].present? && params[:q][:buyer_id_not_null].present?
      { buyer_id_null: "" }
    elsif params[:q][:buyer_id_null].present?
      { buyer_id_null: true }
    elsif params[:q][:buyer_id_not_null].present?
      { buyer_id_not_null: true }
    end
  end
end
