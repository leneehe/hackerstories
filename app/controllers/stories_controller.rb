class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all.page(params[:page]).per(30)

    respond_to do |format|
      format.html
      format.js
    end
  end

end
