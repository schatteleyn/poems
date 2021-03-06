class ShortStoriesController < ApplicationController
  before_action :set_short_story, only: [:show, :edit, :update, :destroy]
  before_action :author_signed_in?, except: [:index, :show]

  # GET /short_stories
  # GET /short_stories.json
  def index
  end

  # GET /short_stories/1
  # GET /short_stories/1.json
  def show
  end

  # GET /short_stories/new
  def new
    @short_story = ShortStory.new
  end

  # GET /short_stories/1/edit
  def edit
  end

  # POST /short_stories
  # POST /short_stories.json
  def create
    @short_story = ShortStory.new(short_story_params)

    respond_to do |format|
      if @short_story.save
        format.html { redirect_to show_text_path('short_story', @short_story.id), notice: 'Short story was successfully created.' }
        format.json { render :show, status: :created, location: @short_story }
      else
        format.html { render :new }
        format.json { render json: @short_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_stories/1
  # PATCH/PUT /short_stories/1.json
  def update
    respond_to do |format|
      if @short_story.update(short_story_params)
        format.html { redirect_to show_text_path('short_story', @short_story.id), notice: 'Short story was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_story }
      else
        format.html { render :edit }
        format.json { render json: @short_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_stories/1
  # DELETE /short_stories/1.json
  def destroy
    @short_story.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Short story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_story
      @short_story = ShortStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_story_params
      params.require(:short_story).permit(:title, :content, :short_description, :author_id, :tag_list)
    end
end
