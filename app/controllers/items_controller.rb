class ItemsController < ApplicationController
    def index
        @categories_men = Category.find(1)
        @items_men = @categories_men.items.order('id ASC').limit(4)

        @categories_lady = Category.find(2)
        @items_lady = @categories_lady.items.order('id ASC').limit(4)

        @categories_baby = Category.find(3)
        @items_baby = @categories_baby.items.order('id ASC').limit(4)

        @categories_cosme = Category.find(4)
        @items_cosme = @categories_cosme.items.order('id ASC').limit(4)

        
        @items_Chanel = Item.where(brand: "シャネル").order('id ASC').limit(4)

        @items_Louis_Vuitton = Item.where(brand: "ルイヴィトン").order('id ASC').limit(4)

        @items_Supream= Item.where(brand: "シュプリーム").order('id ASC').limit(4)

        @items_Nike= Item.where(brand: "ナイキ").order('id ASC').limit(4)

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
    end
end
