class HomesController < ApplicationController
  before_action :prepare_categories, only: [:index, :categories]
  def index
  end

  def categories
    @category = Category.find_by(description: params[:button])
    @recipes = Recipe.where(category_id: @category.id )
  end

  private
  def prepare_categories
    @categories = Category.all.map { |c| c.description }
  end

end
