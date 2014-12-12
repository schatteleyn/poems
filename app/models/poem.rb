class Poem < ActiveRecord::Base
  include TagConcern

  acts_as_taggable

  paginates_per 10

  belongs_to :author

  validates :title, :content, :metaphor, presence: true

end
