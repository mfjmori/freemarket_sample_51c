class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit]

  before_action :move_to_sign_in, only: [:new]
  layout 'user_application', only: :new
  
    def index
    
      @ladies_child_category = Category.where(parent_id:1)
      @ladies_grand_child_category = Category.where(parent_id: @ladies_child_category.each do |child| child.id end)
      @items_lady =  Item.where(category_id:@ladies_grand_child_category.each do |grand_child| grand_child.id end).order('id ASC').limit(4)

      @mens_child_category = Category.where(parent_id:2)
      @mens_grand_child_category = Category.where(parent_id: @mens_child_category.each do |child| child.id end)
      @items_men =  Item.where(category_id:@mens_grand_child_category.each do |grand_child| grand_child.id end).order('id ASC').limit(4)
      
      @baby_child_category = Category.where(parent_id:3)
      @baby_grand_child_category = Category.where(parent_id: @baby_child_category.each do |child| child.id end)
      @items_baby =  Item.where(category_id:@baby_grand_child_category.each do |grand_child| grand_child.id end).order('id ASC').limit(4)

      @cosmes_child_category = Category.where(parent_id:7)
      @cosmes_grand_child_category = Category.where(parent_id: @cosmes_child_category.each do |child| child.id end)
      @items_cosme =  Item.where(category_id:@cosmes_grand_child_category.each do |grand_child| grand_child.id end).order('id ASC').limit(4)


      @items_Chanel = Item.where(brand: "シャネル").order('id ASC').limit(4)

      @items_Louis_Vuitton = Item.where(brand: "ルイヴィトン").order('id ASC').limit(4)

      @items_Supream= Item.where(brand: "シュプリーム").order('id ASC').limit(4)

      @items_Nike= Item.where(brand: "ナイキ").order('id ASC').limit(4)

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


  private
  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :brand, :size, :category_id, :price, :postage, :shipping_method, :region, :shipping_date, :condition, images_attributes: [:image]).merge(saler: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

