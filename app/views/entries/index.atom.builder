atom_feed do |feed|
  feed.title("sousk.net")
  feed.updated(@updated_at)
  
  @entries.each do |entry|
    feed.entry(entry) do |item|
      
      item.title(h(entry.title))
      item.summary(truncate(strip_tags(entry.body), :length => 100))

      item.author do |author|
        author.name('sou')
      end
    end
  end
end