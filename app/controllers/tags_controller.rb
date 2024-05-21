class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show ]

  # GET /tags or /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1 or /tags/1.json
  def show
    @recipes = @tag.recipes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.fetch(:tag, {})
    end
end
