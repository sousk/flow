class EntriesController < ApplicationController
  before_filter :require_authentication, :except=>['index', 'show']
  
  respond_to :html, :xml, :json

  def index
    @entries = Entry.by_params(params).published.paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    respond_with @entries
  end
  
  def show
    @entry = Entry.by_params(params).published.first
    respond_with @entry
  end
end
