class Renter < ApplicationRecord
  GENDER_TYPE = ["Monsieur", "Madame"]
  MARITAL_STATS_TYPE = ["Célibataire", "Marié", "Divorcé"]

  belongs_to :rental

  validates :gender,         presence: true, inclusion: { in: ["Monsieur", "Madame"] }
  validates :first_name,     presence: true
  validates :last_name,      presence: true
  validates :phone_number,   presence: true, format: { with: /\A0\d{9}/ }
  validates :email,          presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :nationality,    presence: true
  validates :date_of_birth,  presence: true
  validates :marital_status, presence: true, inclusion: { in: ["Célibataire", "Marié", "Divorcé"] }
end
