class Api::CategoriesController < ApplicationController
  def index
    if params[:parent_category_id]
      child_categories = Category.where(parent_id: params[:parent_category_id])
      render json: child_categories
    elsif params[:child_category_id]
      grandchild_categories = Category.where(parent_id: params[:child_category_id])
      if grandchild_categories
        render json: grandchild_categories
      end
    elsif params[:grandchild_category_id]
      grand_child_id = params[:grandchild_category_id]
      grandchild_category = Category.find(grand_child_id)
      grandchild_category_parent_id = grandchild_category.parent_id
      render json: grandchild_category_parent_id
    end
  end
end
