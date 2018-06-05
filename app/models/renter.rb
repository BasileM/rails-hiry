class Renter < ApplicationRecord
  GENDER_TYPE = ["Monsieur", "Madame"]
  MARITAL_STATS_TYPE = ["Célibataire", "Marié", "Divorcé"]


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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

  def address
    return "#{street}, #{zip_code} #{city}"
  end

  private

  # def will_save_change_to_address?
  #   will_save_change_to_street? || will_save_change_to_zip_code? || will_save_change_to_city?
  # end
end
