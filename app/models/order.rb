class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  # Validations
  validates :user_id, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending paid shipped delivered cancelled] }

  # Default status
  after_initialize :set_default_status, if: :new_record?

  # Ransack configuration for ActiveAdmin search
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "status", "tax_amount", "total_amount", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "products", "user"]
  end

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
