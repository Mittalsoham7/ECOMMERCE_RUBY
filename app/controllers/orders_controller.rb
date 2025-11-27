class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :load_cart_items, only: [:new, :create]

  # Feature 3.2.1 - List all past orders
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  # Feature 3.2.1 - Show order details
  def show
    @order = current_user.orders.find(params[:id])
  end

  # Feature 3.1.3 ✯ - Checkout form
  def new
    if @cart_items.empty?
      flash[:alert] = "Your cart is empty!"
      redirect_to cart_path and return
    end

    @order = Order.new
    @provinces = Province.all
    @addresses = current_user.addresses
    
    # Calculate cart totals
    @subtotal = @cart_items.sum { |item| item[:subtotal] }
  end

  # Calculate tax for selected province
  def calculate_tax
    province = Province.find(params[:province_id])
    subtotal = params[:subtotal].to_f
    
    tax_rate = province.total_tax_rate
    tax_amount = subtotal * tax_rate
    total = subtotal + tax_amount
    
    render json: {
      province_name: province.name,
      gst: province.gst_rate,
      pst: province.pst_rate,
      hst: province.hst_rate,
      tax_rate: tax_rate,
      tax_amount: tax_amount.round(2),
      total: total.round(2)
    }
  end

  # Feature 3.1.3 ✯ - Process checkout
  def create
    if @cart_items.empty?
      flash[:alert] = "Your cart is empty!"
      redirect_to cart_path and return
    end

    # Get or create address
    if params[:order][:address_id].present?
      address = current_user.addresses.find(params[:order][:address_id])
    else
      address = current_user.addresses.build(address_params)
      unless address.save
        @order = Order.new
        @provinces = Province.all
        @addresses = current_user.addresses
        @subtotal = @cart_items.sum { |item| item[:subtotal] }
        flash.now[:alert] = "Please fix the address errors"
        render :new and return
      end
    end

    # Calculate totals with tax
    subtotal = @cart_items.sum { |item| item[:subtotal] }
    tax_rate = address.province.total_tax_rate
    tax_amount = subtotal * tax_rate
    total_amount = subtotal + tax_amount

    # Create order
    @order = current_user.orders.build(
      total_amount: total_amount,
      tax_amount: tax_amount,
      subtotal: subtotal,
      status: 'pending',
      shipping_address: format_address(address)
    )

    # Create order items
    @cart_items.each do |item|
      @order.order_items.build(
        product_id: item[:product].id,
        quantity: item[:quantity],
        unit_price: item[:price]
      )
    end

    if @order.save
      # Clear cart
      session[:cart] = {}
      flash[:success] = "Order placed successfully! Order ##{@order.id}"
      redirect_to order_path(@order)
    else
      @provinces = Province.all
      @addresses = current_user.addresses
      @subtotal = subtotal
      flash.now[:alert] = "There was an error processing your order"
      render :new
    end
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

  def address_params
    params.require(:order).permit(:street_address, :city, :province_id, :postal_code)
  end

  def format_address(address)
    "#{address.street_address}, #{address.city}, #{address.province.name} #{address.postal_code}"
  end
end
