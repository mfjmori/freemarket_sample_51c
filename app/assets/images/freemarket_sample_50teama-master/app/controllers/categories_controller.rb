class CategoriesController < ApplicationController
  before_action :set_categories, only: :show
  before_action :set_category, only: :show
  before_action :set_items, only: :show

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_items
    category_ids = Category.find(params[:id]).descendant_ids.push(Category.find(params[:id]).id)
    @items = Item.where(category_id: category_ids, status: 1).order(id: "DESC")
  end
end
