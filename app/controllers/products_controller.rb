class ProductsController < ApplicationController
  def index
    # Feature 2.1 ✯ - Front page navigation
    # Feature 2.5 - Pagination with Kaminari
    # Feature 2.6 ✯ - Search by category
    # Feature 2.4 - Product Filters (on_sale, new, recently_updated)
    
    @categories = Category.all
    @products = Product.includes(:categories)
    
    # Search by keyword (in name or description)
    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @products = @products.where("name ILIKE ? OR description ILIKE ?", search_term, search_term)
    end
    
    # Filter by category
    if params[:category_id].present? && params[:category_id] != "all"
      @products = @products.joins(:categories).where(categories: { id: params[:category_id] })
    end
    
    # Feature 2.4 - Apply product filters
    case params[:filter]
    when 'on_sale'
      @products = @products.on_sale
    when 'new'
      @products = @products.new_products
    when 'recently_updated'
      @products = @products.recently_updated
    end
    
    @products = @products.order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
    # Feature 2.3 ✯ - Product detail pages
    @product = Product.includes(:categories).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found"
  end
end
