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
    
    attrs = params[:entry]
    case
      when @entry.published? && attrs[:published_at] == '0'; @entry.unpublish
      when @entry.draft? && attrs[:published_at] == '1'; @entry.publish
    end
    attrs.delete :published_at
    
    @entry.update_attributes! attrs
    render :template => 'admin/entries/edit'
  end
  
  private
  def entry
    Entry
  end
end
