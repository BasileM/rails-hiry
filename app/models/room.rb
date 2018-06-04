class Room < ApplicationRecord
  ROOM_TYPE = ["Salon", "Chambre", "Cuisine", "Salle de bain", "Salle à manger", "Toilettes", "Buanderie", "Bureau", "Garage", "Dressing"]

  belongs_to :housing

  validates :size,         presence: true, numericality: { greater_than: 1,  less_than: 10_000 }
  validates :type_of_room, presence: true, inclusion: { in: ROOM_TYPE }
end
