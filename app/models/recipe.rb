# noinspection RailsParamDefResolve
class Recipe < ApplicationRecord
	# Relations
	belongs_to :author, class_name: 'User', foreign_key: 'author_id'
	has_many :recipe_nutrients, inverse_of: :recipe, dependent: :destroy
	has_many :nutrients, through: :recipe_nutrients
	has_many :sections, inverse_of: :recipe, dependent: :destroy
	has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients, inverse_of: :recipes
	has_many :steps, through: :sections, inverse_of: :recipe, dependent: :destroy
	has_many :reviews, inverse_of: :recipe
	has_many :recipe_tags, inverse_of: :recipe, dependent: :destroy
	has_and_belongs_to_many :tags, inverse_of: :recipes

	# Normalize data
	normalizes :title, :description, with: -> attribute { attribute.strip }

	# Callbacks
	before_validation :find_or_create_tags

	accepts_nested_attributes_for :sections, allow_destroy: true
	accepts_nested_attributes_for :steps, allow_destroy: true
	accepts_nested_attributes_for :recipe_nutrients, allow_destroy: true
	accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
	accepts_nested_attributes_for :tags, allow_destroy: true

	# Validations
	validates :title, presence: true, length: { maximum: 100 }
	validates :cook_time, :prep_time, :total_time, length: { maximum: 8 }, allow_blank: true
	validates :description, length: { maximum: 500 }
	validates :yield, length: { maximum: 500 }, allow_blank: true

	# Scopes
	scope :find_by_tag, -> (tags) { joins(:tags).where(tags: tags) }
	scope :find_by_tag_id, -> (tag_ids) { joins(:tags).where(tags: { id: tag_ids }) }
	scope :find_by_tag_name, -> (tag_names) { joins(:tags).where(tags: { name: tag_names }) }

	# Methods
	def tag_names
		# self.tags.map(&:name)
		self.tags.pluck(:name)
	end

	def ingredient_attributes
		self.ingredients.map do |ingredient|
			ingredient.attributes
		end
	end

	private

		def find_or_create_tags
			self.tags = self.tags.map do |tag|
				Tag.find_or_create_by(name: tag.name)
			end
		end
end



