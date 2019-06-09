class CategoriesController < ApplicationController


    def index
      @categories = Category.all.limit(13)
    end
end
