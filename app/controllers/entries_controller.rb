class EntriesController < ApplicationController
  respond_to :html, :xml, :json, :atom

  def index
    @entries = entry.by_params(params).paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    @updated_at = @entries.size > 0 ? @entries.first.published_at : nil
    
    respond_with @entries
  end
  
  def show
    @entry = entry.by_params(params).first
    
    unless @entry
      render_404 unless @entry
    else
      respond_with @entry
    end
  end
  
  private
  def entry
    Entry.published
  end
end
