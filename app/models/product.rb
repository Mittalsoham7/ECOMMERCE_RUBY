class Product < ApplicationRecord
  # Associations
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  
  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  # Scopes
  scope :in_stock, -> { where('stock_quantity > ?', 0) }
  scope :out_of_stock, -> { where(stock_quantity: 0) }
  scope :recent, -> { where('created_at >= ?', 3.days.ago) }
  scope :recently_updated, -> { where('updated_at >= ? AND created_at < ?', 3.days.ago, 3.days.ago) }
end
