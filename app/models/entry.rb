require 'will_paginate/finders/base'

class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :title
  field :slug
  field :body
  
  # will-paginate
  include WillPaginate::Finders::Base
  cattr_reader :per_page
  @@per_page = 2
  
  class << self
    def recent
      criteria.order_by(:created_at)
    end
    def ranged(p)
      now = Time.now
      time = [p[:year] || now.year, p[:month] || now.month, now.day].join('-').to_time
      period = p[:month] ? :month : :year
      
      criteria.and(
        :created_at => {"$gte" => time.send("beginning_of_#{period}").utc,
          "$lte" => time.send("end_of_#{period}").utc }
      )
    end
    def by_params(p)
      q = ranged(p)
      q = q.criteria.where(:slug => p[:slug]) if p[:slug]
      q
    end
  end
  
  def posted
    created_at("")
  end
  
  def html
    body
  end
end
