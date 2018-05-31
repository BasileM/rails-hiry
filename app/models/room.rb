class Room < ApplicationRecord
  ROOM_TYPE = ["Salon", "Chambre", "Cuisine", "Salle de bain", "Salle à manger", "Toilettes", "Buanderie", "Bureau", "Garage", "Dressing"]

  belongs_to :housing

  validates :type_of_room, presence: true, inclusion: { in: ROOM_TYPE }
end
