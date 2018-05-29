class Inventory < ApplicationRecord
  belongs_to :rental
  belongs_to :room

  validates :state, presence: true, inclusion: { in: ["Mauvais état", "Etat moyen", "Bon état", "Très bon état"] }
end
