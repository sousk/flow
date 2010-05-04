class SessionController < ApplicationController
  def unauthenticated
    # redirect_to new_session_path
    redirect_to "hoge"
  end
  
  def new
  end
  
  def login
    @author = Author.new
  end
end
