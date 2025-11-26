class CategoriesController < ApplicationController
  def show
    # Feature 2.2 - Navigate by category
    @category = Category.find(params[:id])
    @products = @category.products.includes(:categories).order(created_at: :desc).page(params[:page]).per(12)
    @categories = Category.all
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Category not found"
  end
end
