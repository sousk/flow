class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :set_defaults
  attr_accessor :page_title
  
  layout proc{ |r| "default"
    # r.request.request_uri.index(/admin/) ? "admin" : "default" 
  }
  
  protected
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
  
  def set_defaults
    page_title = "blog"
  end
  
  # Auth
  def require_authentication
    do_authenticate unless logged_in?
  end
  def logged_in?
    authenticated? :as_author
  end
  def do_authenticate
    authenticate! :as_author    
  end
  
  # def require_basic_auth
  #   authenticate_or_request_with_http_basic do |name, password|
  #     path = File.join(Rails.root, 'secret.json')
  #     File.exists?(path) && password == JSON.parse(File.read(path))['password']
  #   end
  # end  
end
