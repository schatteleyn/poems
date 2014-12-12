class ShortStory < ActiveRecord::Base
  include TagConcern
  
  acts_as_taggable
  paginates_per 10
  belongs_to :author

  validates :title, :content, :short_description, presence: true
end
