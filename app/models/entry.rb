require 'will_paginate/finders/base'

class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
    
  field :title
  field :slug
  field :body
  field :published_at, :type => DateTime
  
  # will-paginate
  include WillPaginate::Finders::Base
  cattr_reader :per_page
  @@per_page = 2
  
  before_save :compat_slug!
  
  def compat_slug!
    self.slug ||= self.class.make_slug(title)
  end
  
  def publish!(time=nil)
    self.published_at = (time || Time.now).utc
  end
  def published?
    ! published_at.nil?
  end
  
  class << self
    def make_slug(source)
      source.gsub(/[^a-zA-Z0-9\s]/,"").downcase.gsub(/\s/, '-')
    end
    
    #
    # query
    #
    def published
      criteria.where(:published_at => {'$gt' => 0}).order_by(:published_at)
    end
    
    def draft
      criteria.order_by(:created_at)
    end
    
    def ranged(p)
      now = Time.now
      time = [p[:year] || now.year, p[:month] || now.month, now.day].join('-').to_time
      period = p[:month] ? :month : :year
      
      criteria.and(
        :published_at => {"$gte" => time.send("beginning_of_#{period}").utc,
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
    published_at("")
  end
  
  def html
    body
  end
end
