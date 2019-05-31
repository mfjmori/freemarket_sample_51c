class ItemsController < ApplicationController

  require 'payjp'
  before_action :set_item, only: [:show, :destroy, :edit, :confirm, :pay, :update]
  before_action :set_categories, only: [:index, :show, :search, :new, :create, :edit]
  before_action :authenticate_user!, only: [:new, :create, :confirm, :edit, :destroy]

  def index # トップページ、アイテムをカテゴリー別に最新投稿順番に
    @ladies_items = set_category_items('レディース')
    @mens_items = set_category_items('メンズ')
    @kids_items = set_category_items('ベビー・キッズ')
    @cosme_items = set_category_items('コスメ・香水・美容')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_new)
    @item[:category_id] = set_items_category_id
    respond_to do |format|
      if @item.save
        # rails scaffold item で自動作成されたコントローラ記述をそのまま移植。
        # TODO: 仮置きredirect, 最終形=>newページ内でモーダル表示させる
        UserItem.create(user_id: current_user.id, item_id: @item.id)
        if params[:file]
          for i in 0..10
            Image.create(image: params[:file]["#{i}"], item_id: @item.id) if params[:file]["#{i}"] != nil
          end
        end
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        # TODO: 最終形=>入力不備label部分に赤字でガイド表示させる
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @same_user_items = Item.joins(:users).where('users.id = ? AND status = ?', @item.users[0].id, 1).where.not(id: @item.id).order(id: 'DESC').limit(6)
    category_ids = Category.find(@item.category_id).descendant_ids.push(@item.category_id)
    @same_category_items = Item.where(category_id: category_ids, status: 1).where.not(id: @item.id).order(id: 'DESC').limit(6)
  end

  def confirm
    begin
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
    customer = Payjp::Customer.retrieve(current_user.payjp_id)
    default_card = customer.default_card
    @card = customer.cards.retrieve(default_card)
    rescue => e
      redirect_to item_path
    end
  end

  def edit
  end

  def update
    @item[:category_id] = set_items_category_id
    if @item.update(params_new)
      redirect_to item_path(@item)
    else
      redirect_to edit_item_path
    end
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(40)
    @all_items = Item.order(id: "DESC").limit(40)
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item)
    end
  end

  private

  def params_new
    params.require(:item).permit(:name, :condition, :detail, :delivery_method, :delivery_prefecture, :delivery_cost, :delivery_day, :price, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category_items(name)
    category_ids = Category.find_by(name: name).descendant_ids.push(Category.find_by(name: name).id)
    return Item.where(category_id: category_ids, status: 1).order(id: "DESC").limit(4)
  end

  def set_items_category_id
    if params[:item][:grandchild_category_id].present?
      return params[:item][:grandchild_category_id]
    elsif params[:item][:child_category_id].present?
      return params[:item][:child_category_id]
    else
      return params[:item][:parent_category_id]
    end
  end
end
