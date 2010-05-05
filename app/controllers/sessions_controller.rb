class SessionsController < ApplicationController
  def unauthenticated
    redirect_to new_session_path
  end
  
  def new
    if logged_in?
      flash[:notice] = "you already have logged in as "+user.name
      redirect_to :root
    end
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
  
  def destroy
    logout
    flash[:notice] = "logged out"
    redirect_to :new_session
  end
end
