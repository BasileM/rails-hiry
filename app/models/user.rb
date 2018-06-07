class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Required for address autocomplete (do not comment out please)
  geocoded_by :address
  after_validation :geocode
  # Gravatar
  include Gravtastic
  gravtastic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :housings
  has_many :rentals, through: :housings

  validates :date_of_birth,  numericality: { only_integer: true, greater_than: 0 }
end
