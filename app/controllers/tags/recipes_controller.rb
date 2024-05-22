class Tags::RecipesController < ApplicationController
	before_action :set_tag

	def index
		@recipes = @tag.recipes
	end

	private
		def set_tag
			@tag = Tag.find(params[:tag_id])
		end
end
