class EntriesController < ApplicationController
  before_filter :require_authentication, :except=>['index', 'show']

  def index
    # query = query.ranged params if params[:year]
    
    # @entries = Entry.paginate(
    #   :page => (params[:page] || 1), :per_page => Entry.per_page, :sort => ['_id', :asc])
    @entries = Entry.by_params(params).paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page, :sort => ['_id', :asc])
    
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
    @entry = Entry.by_params(params).first
  end
  
  def destroy
  end
end
