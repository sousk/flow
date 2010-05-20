class Admin::EntriesController < ApplicationController
  before_filter :require_authentication
  
  respond_to :html, :xml, :json
  
  def index
    @entries = entry.draft.by_params(params).paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    render :template => 'entries/index'
  end
  
  def edit
    @entry = entry.first(:conditions=>{:id => params[:id]})
    render_404 unless @entry
  end
  
  def update
    @entry = entry.first(:conditions=>{:id => params[:id]})
    render_404 unless @entry
    
    raise params[:slug].to_s
    @entry.update_attributes! :slug => params[:slug]
    puts "---"
    p @entry.slug
    p params
    flash[:notice] = "updated!"
    render :template => 'admin/entries/edit'
  end
  
  private
  def entry
    Entry
  end
end
