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
end
