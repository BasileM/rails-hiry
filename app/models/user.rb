class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :housings
  has_many :rentals, through: :housings

  def address
    return "#{street}, #{zip_code} #{city}"
  end

  private

  def will_save_change_to_address?
    will_save_change_to_street? || will_save_change_to_zip_code? || will_save_change_to_city?
  end
end
