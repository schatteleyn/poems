class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :author_signed_in?, only: [:new_text]

  def index
    # Call the root_path with optionnal tag argument
    if params[:tag]
      @poems = Poem.tagged_with(params[:tag])
      @short_stories = ShortStory.tagged_with(params[:tag])
      @authors = Authors.tagged_with(params[:tag])
    else
      @poems = Poem.all
      @short_stories = ShortStory.all
      @authors = []
    end
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
    elsif params[:type] == ShortStory.model_name.param_key
      @text = ShortStory.find(params[:id])
    end

    render 'shared/show'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :biography]
  end
end
