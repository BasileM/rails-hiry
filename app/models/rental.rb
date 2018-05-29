class Rental < ApplicationRecord
  belongs_to :housing
  has_many :receipts
  has_many :renters

  validates :furnished,        presence: true
  validates :start_date,       presence: true
  validates :end_date,         presence: true
  validates :monthly_rent,     presence: true, numericality: { only_integer: true, greater_than: 1,  less_than: 10_000 }
  validates :monthly_expenses, presence: true, numericality: { only_integer: true, greater_than: 1,  less_than: 10_000 }
end
