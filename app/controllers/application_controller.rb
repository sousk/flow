class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # before_filter :set_defaults, :authenticate!
  before_filter :set_defaults
  attr_accessor :page_title
  
  layout proc{ |r| "default"
    # r.request.request_uri.index(/admin/) ? "admin" : "default" 
  }
  
  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  
  protected
  def require_authentication
    puts "---on cnt"
    p authenticated?
    puts "---/on cnt"
    unless warden.authenticated?
      authenticate!
    end
  end
  
  def set_defaults
    page_title = "blog"
  end
end
