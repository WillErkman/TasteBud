class GenerateDescriptionJob < ApplicationJob
  queue_as :default

  def perform(ingredient)
    ingredient.generate_description
  end
end

