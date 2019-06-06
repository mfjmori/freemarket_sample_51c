class Api::CategoriesController < ApplicationController
  def index
    if params[:parent_category_id]
      child_categories = Category.where(parent_id: params[:parent_category_id])
      render json: child_categories
    elsif params[:child_category_id]
      grandchild_categories = Category.where(parent_id: params[:child_category_id])
      render json: grandchild_categories
    end
  end
end
