class Housing < ApplicationRecord
  TYPE_OF_HOUSING = ["Appartement", "Maison"]
  LEGAL_REGIME_TYPE = ["Mono propriété", "Copropriété"]

  # geocoded_by :address
  # after_validation :geocode
  belongs_to :user
  has_many :rooms
  has_many :images, through: :rooms
  has_many :rentals
  has_many :renters, through: :rentals
  has_many :inventories, through: :rentals

  validates :type_of_housing,      presence: true, inclusion: { in: TYPE_OF_HOUSING }
  validates :legal_regime,         presence: true, inclusion: { in: LEGAL_REGIME_TYPE }
  validates :floor,                presence: true, numericality: { only_integer: true, greater_than: 0 }, if: :appartement? # Name of private method
  validates :year_of_construction, presence: true, numericality: { greater_than: 1000,  less_than: 2018 }
  validates :size,                 presence: true, numericality: { greater_than: 1,  less_than: 10_000 }
  validates :city,                 presence: true
  
  private
  
  def appartement?
    type_of_housing == "Appartement"
  end
  
end
