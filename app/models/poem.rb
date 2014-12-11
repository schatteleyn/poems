class Poem < ActiveRecord::Base
  include TagConcern

  acts_as_taggable

  belongs_to :author

  validates :title, :content, :metaphor, presence: true

end
