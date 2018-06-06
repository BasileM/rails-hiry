class Image < ApplicationRecord
  belongs_to :room

  # Carrierwave gem
  mount_uploader :photo, PhotoUploader

end
