class Entry < ActiveRecord::Base
  
  # will-paginate
  cattr_reader :per_page
  @@per_page = 2
  
  # basics
  scope :limited, limit(@@per_page)
  scope :recently, order('created_at DESC')
  
  # utils
  scope :list, lambda {
    limited.recently
  }
  scope :between, lambda {|from, to|
    where("created_at >= ? AND created_at <= ?", 
        from.to_s(:db), to.to_s(:db))
  }
  
  class << self
    # def between(from, to)
    #   Entry.recently.limited.where("created_at >= ? AND created_at <= ?", 
    #       from.to_s(:db), to.to_s(:db))
    # end
  end
  
  def html
    body
  end
end
