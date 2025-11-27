class Province < ApplicationRecord
  # Associations
  has_many :addresses

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :gst_rate, :pst_rate, :hst_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Calculate total tax rate
  def total_tax_rate
    gst_rate + pst_rate + hst_rate
  end

  # Ransack configuration for ActiveAdmin search
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gst_rate", "hst_rate", "id", "name", "pst_rate", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["addresses"]
  end
end
