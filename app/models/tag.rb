class Tag < ApplicationRecord
	# Relations
	has_one_attached :image
	has_and_belongs_to_many :recipes,  inverse_of: :tags

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Normalize name
	normalizes :name, with: -> name { name.downcase.strip }

	# Callbacks
	after_create :generate_image

	# Methods
	def generate_image
		response = OpenAI::Client.new.images.generate(
			parameters: {
				prompt: name,
				size: "256x256" })
		#tempfile = Down.download(response.dig("data", 0, "url"))
		image.attach(io: URI.parse(response.dig("data", 0, "url")).open, filename: "#{name}.png")
	end

end
