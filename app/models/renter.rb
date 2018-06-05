class Renter < ApplicationRecord
  GENDER_TYPE = ["Monsieur", "Madame"]
  MARITAL_STATS_TYPE = ["Célibataire", "Marié", "Divorcé"]

  belongs_to :rental

  validates :gender,         presence: true, inclusion: { in: GENDER_TYPE }
  validates :first_name,     presence: true
  validates :last_name,      presence: true
  validates :phone_number,   presence: true, format: { with: /\A0\d{9}/ }
  validates :email,          presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :nationality,    presence: true
  validates :date_of_birth,  presence: true
  validates :marital_status, presence: true, inclusion: { in: MARITAL_STATS_TYPE }

  def owner
    @rental  = Rental.find(self.rental_id)
    @housing = Housing.find(@rental.housing_id)
    @owner   = User.find(@housing.user_id)
  end
end
