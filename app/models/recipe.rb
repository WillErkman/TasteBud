class Recipe < ApplicationRecord
  # Relations
  belongs_to :author, class_name: 'User'
  has_many :reviews
  
  # Allow Recipe_Ingredients to be created with Recipe
  has_many :sections
  accepts_nested_attributes_for :sections, allow_destroy: true
  
  # Allow Ingredients to be created with Recipe
  has_many :ingredient_lists, through: :sections
  accepts_nested_attributes_for :ingredient_lists
  
  # Allow Procedures to be created with Recipe
  has_many :procedures, through: :sections
  accepts_nested_attributes_for :procedures, allow_destroy: true
  # Validations

  # Methods

end
