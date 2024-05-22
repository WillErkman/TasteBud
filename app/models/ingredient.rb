class Ingredient < ApplicationRecord
	# Relations
	has_one_attached :image
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients, inverse_of: :ingredients

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..100 }

	# Callbacks

	# Normalization
	normalizes :name, with: -> name { name.downcase.strip }
	normalizes :description, with: -> description { description.strip if description }

	# Methods
	def generate_image
		response = OpenAI::Client.new.images.generate(
			parameters: {
				prompt: self.name,
				size: "256x256" })
		self.image.attach(io: URI.parse(response.dig("data", 0, "url")).open, filename: "#{self.name.parameterize(separator: "_")}_ing.png")
	end

	def generate_description
		response = OpenAI::Client.new.chat(
			parameters: {
				model: "gpt-4o", # Required.
				messages: [{ role: "user", content: "Give a description of #{self.name} and list some common culinary uses for #{self.name}" }], # Required.
				temperature: 0.7,
				max_tokens: 400
			})
		self.description = response.dig("choices", 0, "message", "content")
	end
end
