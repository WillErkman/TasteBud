class Tag < ApplicationRecord
	# Relations
	has_one_attached :image
	has_and_belongs_to_many :recipes, inverse_of: :tags

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Callbacks
	after_create GenerateImageJob.perform_later self

	# Methods
	def generate_image
		response = OpenAI::Client.new.images.generate(
			parameters: {
				prompt: self.name,
				size: "256x256" })
		self.image.attach(io: URI.parse(response.dig("data", 0, "url")).open, filename: "#{self.name.parameterize(separator: "_")}_tag.png")
	end
end
