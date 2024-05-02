#noinspection RailsParamDefResolve
class Recipe < ApplicationRecord
	# Relations
	belongs_to :author, class_name: 'User', foreign_key: 'author_id'
	has_one :nutrition, dependent: :destroy
	has_many :sections, inverse_of: :recipe, dependent: :destroy
	has_many :ingredient_lists, through: :sections, inverse_of: :recipe, dependent: :destroy
	has_many :ingredients, through: :ingredient_lists, inverse_of: :recipes
	has_many :procedures, through: :sections, inverse_of: :recipe, dependent: :destroy
	has_many :reviews, inverse_of: :recipe
	has_and_belongs_to_many :tags, inverse_of: :recipes

	# Allow Section to be created from Recipe
	accepts_nested_attributes_for :sections, allow_destroy: true
	accepts_nested_attributes_for :nutrition, allow_destroy: true

	# Validations
	validates :title, presence: true, length: { in: 3..100 }
	validates :cook_time, :prep_time, :total_time, length: { maximum: 8 }, allow_blank: true
	validates :description, length: { maximum: 500 }, allow_blank: true
	validates :yield, length: { maximum: 500 }, allow_blank: true

	# Methods
	scope :find_by_tags, ->(tags) { where(tags: tags) }
	def tag_names
		tags.pluck(:name)
	end
end
