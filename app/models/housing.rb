class Housing < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :rentals
  has_many :renters, through: :rentals

  validates :type_of_housing,      presence: true, inclusion: { in: ["Appartement", "Maison"] }
  validates :legal_regime,         presence: true, inclusion: { in: ["Mono propriété", "Copropriété"] }
  validates :year_of_construction, presence: true, numericality: { greater_than: 1000,  less_than: 2018 }
  validates :size,                 presence: true, numericality: { greater_than: 1,  less_than: 10_000 }
  validates :city,                 presence: true
end
