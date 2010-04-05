class EntriesController < ApplicationController
  before_filter :require_authentication, :except=>['index', 'show']

  def index
    query = Entry.recent
    query = query.ranged params if params[:year]
    
    @entries = query.paginate :page=>params[:page] || 1, :per_page=>Entry.per_page
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @entries }
    end
  end
  
  def new
    raise "Stop"
  end
  
  def create
    authenticated?
  end
  
  def show
    @entry = Entry.recent.ranged(params).first
  end
  
  def destroy
  end
end
