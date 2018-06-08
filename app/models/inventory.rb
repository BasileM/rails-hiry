class Inventory < ApplicationRecord
  STATES = ["Mauvais", "Moyen", "Bon", "Très bon"]

  belongs_to :rental
  belongs_to :room

  validates :state, presence: true, inclusion: { in: STATES }
end
