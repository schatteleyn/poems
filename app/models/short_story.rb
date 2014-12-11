class ShortStory < ActiveRecord::Base
  
  belongs_to :author

  validates :title, :content, :short_description, presence: true
end
