class ProductsController < ApplicationController
  def index
    # Feature 2.1 ✯ - Front page navigation
    # Feature 2.5 - Pagination with Kaminari
    @products = Product.includes(:categories).order(created_at: :desc).page(params[:page]).per(12)
    @categories = Category.all
  end

  def show
    # Feature 2.3 ✯ - Product detail pages
    @product = Product.includes(:categories).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found"
  end
end
