class Address < ApplicationRecord
  belongs_to :user
  belongs_to :province

  # Validations
  validates :street_address, presence: true, length: { minimum: 5, maximum: 200 }
  validates :city, presence: true, length: { minimum: 2, maximum: 100 }
  validates :postal_code, presence: true, format: { with: /\A[A-Z]\d[A-Z] ?\d[A-Z]\d\z/i, message: "must be a valid Canadian postal code" }
  validates :user_id, presence: true
  validates :province_id, presence: true

  # Ransack configuration for ActiveAdmin search
  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "id", "postal_code", "province_id", "street_address", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["province", "user"]
  end
end
