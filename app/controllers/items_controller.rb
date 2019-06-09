
class ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    def new
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
        @items = Item.find(params[:id])
        @users = @items.saler


        @theparent =Category.find(params[:id])
        category = Item.find(params[:id])
        groundchild_id =category.category_id
        @groundchild =Category.find_by(id: groundchild_id)
        child_id =@groundchild.parent_id
        @child=Category.find_by(id: child_id)
    end

    private
    def item_params
        params.permit(:image,:text)
    end

end

