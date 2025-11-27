ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :total_amount do |order|
      number_to_currency(order.total_amount)
    end
    column :tax_amount do |order|
      number_to_currency(order.tax_amount)
    end
    column :status do |order|
      status_tag order.status
    end
    column :created_at
    actions
  end

  filter :user
  filter :status, as: :select, collection: ['pending', 'paid', 'shipped', 'delivered', 'cancelled']
  filter :created_at

  form do |f|
    f.inputs "Order Status" do
      f.input :status, as: :select, collection: ['pending', 'paid', 'shipped', 'delivered', 'cancelled']
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :address do |order|
        if order.address
          "#{order.address.street_address}, #{order.address.city}, #{order.address.province.name} #{order.address.postal_code}"
        else
          "No address"
        end
      end
      row :subtotal do |order|
        number_to_currency(order.total_amount - order.tax_amount)
      end
      row :tax_amount do |order|
        number_to_currency(order.tax_amount)
      end
      row :total_amount do |order|
        number_to_currency(order.total_amount)
      end
      row :status do |order|
        status_tag order.status
      end
      row :created_at
      row :updated_at
    end
    
    panel "Order Items" do
      table_for order.order_items do
        column "Product" do |item|
          link_to item.product.name, admin_product_path(item.product)
        end
        column :quantity
        column "Unit Price" do |item|
          number_to_currency(item.unit_price)
        end
        column "Total" do |item|
          number_to_currency(item.quantity * item.unit_price)
        end
      end
    end
  end
end
