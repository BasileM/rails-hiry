class Rental < ApplicationRecord
  belongs_to :housing
  has_many :receipts
  has_one :renter
  has_many :inventories

  validates :furnished, default: false
  validates :start_date,       presence: true
  validates :monthly_rent,     presence: true, numericality: { only_integer: true, greater_than: 1,  less_than: 10_000 }
  validates :monthly_expenses, presence: true, numericality: { only_integer: true, greater_than: 1,  less_than: 10_000 }

  accepts_nested_attributes_for :inventories
  # Carrierwave gem
  mount_uploader :file, FileUploader
end
