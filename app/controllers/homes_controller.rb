class HomesController < ApplicationController
  before_action :prepare_categories, only: [:index, :categories, :search]
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def categories
    @category = Category.find_by(description: params[:button])
    @recipes = Recipe.where(category_id: @category.id )
  end

  def search
    @recipes = Recipe.where("name ILIKE ?", "%#{params[:search]}%")
  end

  def comments
    @recipe = Recipe.find(params[:format].to_i)
  end

  private
  def prepare_categories
    @categories = Category.all.map { |c| c.description }
  end

end
