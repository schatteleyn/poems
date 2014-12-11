['love', 'hate', 'war', 'death', 'colors', 'life', 'joy', 'feelings', 'hero'].each do |tag|
  ActsAsTaggableOn::Tag.create(name: tag)
end
