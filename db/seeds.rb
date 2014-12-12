['love', 'hate', 'war', 'death', 'color', 'life', 'joy', 'feeling', 'hero'].each do |tag|
  ActsAsTaggableOn::Tag.create(name: tag)
end
