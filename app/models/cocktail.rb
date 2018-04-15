class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy

  validates :name, presence: true, allow_blank: false, uniqueness: true

  mount_uploader :photo, PhotoUploader # cloudinary / upload photo
end
