class ItemsController < ApplicationController
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
    item_parameter = item_params
    @item = Item.new(item_parameter)
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
  def item_params
    params.require(:item).permit(:name, :description, :brand, :category_id, :size, :price, :postage, :shipping_method, :region, :shipping_date, :condition, images_attributes: [:image])
  end
end
