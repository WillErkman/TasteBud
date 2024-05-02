class Section < ApplicationRecord
  # Relations
  belongs_to :recipe, inverse_of: :sections
  has_one :procedure, inverse_of: :section
  has_many :ingredient_lists, inverse_of: :section
  has_many :ingredients, through: :ingredient_lists

  accepts_nested_attributes_for :ingredient_lists, allow_destroy: true
  accepts_nested_attributes_for :procedure, allow_destroy: true

  # Validations
  validates :title, :description, presence: true
  validates :title, uniqueness: { scope: :recipe_id }

  # Methods

  private
    # def reject_procedure?(ingredient)
    #
    # end
    #
    # def reject_ingredient_list?(ingredient_list)
    #
    # end
end
