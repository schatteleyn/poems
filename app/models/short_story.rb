class ShortStory < ActiveRecord::Base
  include TagConcern
  
  belongs_to :author

  validates :title, :content, :short_description, presence: true
end
