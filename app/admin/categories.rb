ActiveAdmin.register Category do
  permit_params :name, :description

  # Configure pagination
  config.per_page = 30

  controller do
    def scoped_collection
      end_of_association_chain.page(params[:page]).per(30)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :products do |category|
      category.products.count
    end
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :description, as: :text
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :products_count do |category|
        category.products.count
      end
      row :created_at
      row :updated_at
    end
    
    panel "Products in this Category" do
      table_for category.products do
        column :name
        column :price do |product|
          number_to_currency(product.price)
        end
        column :stock_quantity
        column "Actions" do |product|
          link_to "View", admin_product_path(product)
        end
      end
    end
  end
end
