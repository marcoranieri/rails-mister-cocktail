class Ingredient < ApplicationRecord
# cocktails <----> doses <----> ingredient
  has_many :doses

  has_many :cocktails, through: :doses # not sure if needed both way

  validates :name, presence: true, allow_blank: false, uniqueness: true

end
