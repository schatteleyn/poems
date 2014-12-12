module TagConcern
  extend ActiveSupport::Concern
  
  included do
    before_save :find_tag
  end

  private

  def find_tag
    foo = nil
    if self.class == Author
      foo = :biography
    else
    	foo = :content
    end
    text = self[foo].downcase
    tag_list = ActsAsTaggableOn::Tag.all.map(&:name)
    to_add_tags = []

    tag_list.collect do |tag| 
      if text.include? tag 
        to_add_tags << tag
      end
    end

    self.tag_list.add(to_add_tags) unless to_add_tags.nil?
  end
end
