class SessionsController < ApplicationController
  def unauthenticated
    redirect_to new_session_path
  end
  
  def new
  end
  
  def create
    do_authenticate
    
    if logged_in?
      redirect_to :root
    else
      flash[:notice] = "invalid name or password"
      redirect_to :new_session
    end
  end
end
