class Cocktail < ApplicationRecord
# cocktails <----> doses <----> ingredient
  has_many :ingredients, through: :doses # so you can do cockt.ingredient
# if cockt destroy, destroy also doses but not the ingredient
  has_many :doses, dependent: :destroy

  validates :name, presence: true, allow_blank: false, uniqueness: true

  mount_uploader :photo, PhotoUploader # cloudinary / upload photo
end
