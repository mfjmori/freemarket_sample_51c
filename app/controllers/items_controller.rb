class ItemsController < ApplicationController
    def index
        
    end
    def new
      @item = Item.new
    end
    def create
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
    def set_item
      params.require(:items).permit(:name, :description, :brand, :categories_id, :size, :price, :postage, :shipping_method, :region, :shipping_date, :condition)
    end
end
