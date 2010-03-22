class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout proc{ |r| "default"
    # r.request.request_uri.index(/admin/) ? "admin" : "default" 
  }
end
