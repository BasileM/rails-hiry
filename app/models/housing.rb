class Housing < ApplicationRecord
  TYPE_OF_HOUSING = ["Appartement", "Maison"]
  LEGAL_REGIME_TYPE = ["Mono propriété", "Copropriété"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :rooms
  has_many :rentals
  has_many :renters, through: :rentals
  has_many :inventories, through: :rentals

  validates :type_of_housing,      presence: true, inclusion: { in: TYPE_OF_HOUSING }
  validates :legal_regime,         presence: true, inclusion: { in: LEGAL_REGIME_TYPE }
  validates :floor,                presence: true, numericality: { greater_than: 0 }
  validates :year_of_construction, presence: true, numericality: { greater_than: 1000,  less_than: 2018 }
  validates :size,                 presence: true, numericality: { greater_than: 1,  less_than: 10_000 }
  validates :city,                 presence: true

  def address
    return "#{street}, #{zip_code} #{city}"
  end

  private

  def will_save_change_to_address?
    will_save_change_to_street? || will_save_change_to_zip_code? || will_save_change_to_city?
  end
end
