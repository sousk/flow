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
  
  scope :recent, order_by(['created_at', :desc])
  
  class << self
  end
  
  def posted
    created_at("")
  end
  
  def html
    body
  end
end
