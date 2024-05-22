class GenerateImageJob < ApplicationJob
  queue_as :default

  def perform(item)
    item.generate_image
  end
end

