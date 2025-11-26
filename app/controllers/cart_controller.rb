class CartController < ApplicationController
  before_action :initialize_cart
  before_action :load_cart_items, only: [:index]

  # Feature 3.1.1 ✯ - Display shopping cart
  def index
    @cart_total = calculate_cart_total
  end

  # Feature 3.1.1 ✯ - Add item to cart
  def add_item
    product = Product.find(params[:id])
    quantity = params[:quantity]&.to_i || 1

    if @cart[product.id.to_s]
      @cart[product.id.to_s]['quantity'] += quantity
    else
      @cart[product.id.to_s] = {
        'quantity' => quantity,
        'price' => product.price.to_f
      }
    end

    session[:cart] = @cart
    flash[:notice] = "#{product.name} added to cart!"
    redirect_to request.referer || products_path
  end

  # Feature 3.1.2 - Update item quantity in cart
  def update_item
    product_id = params[:id]
    quantity = params[:quantity].to_i

    if quantity > 0
      @cart[product_id]['quantity'] = quantity
      session[:cart] = @cart
      flash[:notice] = "Cart updated successfully!"
    else
      remove_item_from_cart(product_id)
      flash[:notice] = "Item removed from cart!"
    end

    redirect_to cart_path
  end

  # Feature 3.1.2 - Remove item from cart
  def remove_item
    product_id = params[:id]
    product = Product.find(product_id)
    
    remove_item_from_cart(product_id)
    flash[:notice] = "#{product.name} removed from cart!"
    redirect_to cart_path
  end

  # Clear entire cart
  def clear
    session[:cart] = {}
    flash[:notice] = "Cart cleared!"
    redirect_to cart_path
  end

  private

  def initialize_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def load_cart_items
    @cart_items = []
    @cart.each do |product_id, item_data|
      product = Product.find_by(id: product_id)
      if product
        @cart_items << {
          product: product,
          quantity: item_data['quantity'],
          price: item_data['price'],
          subtotal: item_data['quantity'] * item_data['price']
        }
      end
    end
  end

  def calculate_cart_total
    @cart_items.sum { |item| item[:subtotal] }
  end

  def remove_item_from_cart(product_id)
    @cart.delete(product_id)
    session[:cart] = @cart
  end
end
