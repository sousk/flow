module EntryHelper
  # FIXME to be cool
  def entry_perm_path(entry)
    sprintf "/entries/%04d/%02d/%s", 
      entry.created_at.year, entry.created_at.month, entry.slug
  end
end
