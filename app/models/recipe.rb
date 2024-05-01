class Recipe < ApplicationRecord
  # Relations
  belongs_to :author, class_name: 'User'
  has_many :reviews
  
  # Allow Recipe_Ingredients to be created with Recipe
  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  # Allow Ingredients to be created with Recipe
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients
  
  # Allow Instruction_Sections to be created with Recipe
  has_many :instruction_sections
  accepts_nested_attributes_for :instruction_sections, allow_destroy: true
  
  # Allow Instructions to be created with Recipe
  has_many :instructions, through: :instruction_sections
  accepts_nested_attributes_for :instructions, allow_destroy: true


  # Validations

  # Methods

end
