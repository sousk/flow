class Entry
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title
  field :slug
  field :body
  
  # will-paginate
  cattr_reader :per_page
  @@per_page = 2
  
  class << self
  end
  
  def posted
    created_at("")
  end
  
  def html
    body
  end
end
