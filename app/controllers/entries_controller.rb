class EntriesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @entries = entry.by_params(params).paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    respond_with @entries
  end
  
  def show
    @entry = entry.by_params(params).first
    respond_with @entry
  end
  
  private
  def entry
    Entry.published
  end
end
