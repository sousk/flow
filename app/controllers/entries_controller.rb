class EntriesController < ApplicationController
  before_filter :require_authentication, :except=>['index', 'show']

  def index
    query = Entry.recent
    # query = query.ranged params if params[:year]
    
    # paginate(:page => page, :per_page => size, :sort => [['ontology_term_id', :desc], ['_id', :asc]])
    Entry.per_page
    puts "--"
    p query
    # @entries = query.find :all
    @entries = Entry.all
    # @entries = query.paginate :page=>(params[:page] || 1), :per_page=>Entry.per_page, :sort =>[['created_at', :desc], ['_id', :asc]]
    
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
