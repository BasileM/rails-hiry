class Inventory < ApplicationRecord
  STATES = ["Mauvais état", "Etat moyen", "Bon état", "Très bon état"]

  belongs_to :rental
  belongs_to :room

  validates :state, presence: true, inclusion: { in: STATES }
end
