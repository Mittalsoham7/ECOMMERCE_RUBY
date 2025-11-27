ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :on_sale, :image, category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :price do |product|
      number_to_currency(product.price)
    end
    column :stock_quantity
    column :on_sale
    column :categories do |product|
      product.categories.map(&:name).join(", ")
    end
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :stock_quantity
  filter :on_sale
  filter :categories
  filter :created_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description, as: :text
      f.input :price
      f.input :stock_quantity
      f.input :on_sale
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, height: 100) : content_tag(:span, "No image uploaded")
      f.input :categories, as: :check_boxes, collection: Category.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |product|
        number_to_currency(product.price)
      end
      row :stock_quantity
      row :on_sale
      row :image do |product|
        if product.image.attached?
          image_tag product.image, height: 200
        else
          "No image"
        end
      end
      row :categories do |product|
        product.categories.map(&:name).join(", ")
      end
      row :created_at
      row :updated_at
    end
  end
end
