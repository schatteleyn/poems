class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :author_signed_in?, only: [:new_text]

  def index
    if params[:tag]
      poems = Poem.tagged_with(params[:tag])
      short_stories = ShortStory.tagged_with(params[:tag])
      @authors = Author.tagged_with(params[:tag]).page(params[:page_authors]).per(10)
    else
      poems = Poem.all
      short_stories = ShortStory.all
      @authors = []
    end
    @poems = poems.page(params[:page_poems])
    @short_stories = short_stories.page(params[:page_stories])

    render 'shared/index'
  end

  def new_text
    @poem = Poem.new
    @short_story = ShortStory.new

    render "shared/new"
  end

  def show_text
    if params[:type] == Poem.model_name.param_key
      @text = Poem.find(params[:id])
      @text_type = Poem.model_name.param_key
    elsif params[:type] == ShortStory.model_name.param_key
      @text = ShortStory.find(params[:id])
      @text_type = ShortStory.model_name.param_key
    end
    
    render 'shared/show'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :biography]
  end
end
