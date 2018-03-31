class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    # Story.delete_all

    @stories = Story.all.page(params[:page]).per(30)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:id, :title, :url, :site, :points, :author, :time, :comments)
    end
end
