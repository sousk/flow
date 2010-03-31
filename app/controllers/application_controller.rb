class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # before_filter :set_defaults, :authenticate!
  before_filter :set_defaults
  attr_accessor :page_title
  
  layout proc{ |r| "default"
    # r.request.request_uri.index(/admin/) ? "admin" : "default" 
  }
  
  def set_defaults
    page_title = "blog"
  end
end
