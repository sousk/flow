class SessionsController < ApplicationController
  def unauthenticated
    redirect_to new_session_path
  end
  
  def new
  end
  
  def create
    @author = Author.authenticate params
    unless @author
      flash[:notice] = "invalid name or password"
      redirect_to :new_session_path
    end
    
    serialize_into_session @author
  end
end
