ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :orders do |user|
      user.orders.count
    end
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :orders_count do |user|
        user.orders.count
      end
      row :created_at
      row :updated_at
    end
    
    panel "User Orders" do
      table_for user.orders.order(created_at: :desc) do
        column "Order ID" do |order|
          link_to "##{order.id}", admin_order_path(order)
        end
        column :total_amount do |order|
          number_to_currency(order.total_amount)
        end
        column :status do |order|
          status_tag order.status
        end
        column :created_at
      end
    end
    
    panel "User Addresses" do
      table_for user.addresses do
        column :street_address
        column :city
        column :province do |address|
          address.province.name
        end
        column :postal_code
      end
    end
  end
end
