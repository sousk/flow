class SessionsController < ApplicationController
  def unauthenticated
    redirect_to new_session_path
  end
  
  def new
  end
  
  def create
    @author = Author.authenticate params
    if @author
      user = @author
      puts "-------------"
      p warden.result
      p user
      puts "-------------"
      redirect_to :root
    else
      flash[:notice] = "invalid name or password"
      redirect_to :new_session
    end
  end
end
