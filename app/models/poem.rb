class Poem < ActiveRecord::Base

  belongs_to :author

  validates :title, :content, :metaphor, presence: true
end
