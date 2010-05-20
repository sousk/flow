class EntriesController < ApplicationController
  before_filter :require_authentication, :except=>['index', 'show']

  def index
    @entries = Entry.by_params(params).published.paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @entries }
    end
  end
  
  def new
  end
  
  def create
    authenticated?
  end
  
  def show
    @entry = Entry.by_params(params).published.first
  end
  
  def destroy
  end
end
