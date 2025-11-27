class Category < ApplicationRecord
  # Pagination
  paginates_per 30

  # Associations
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
  
  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :description, length: { maximum: 500 }, allow_blank: true

  # Ransack configuration for ActiveAdmin search
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["product_categories", "products"]
  end
end
