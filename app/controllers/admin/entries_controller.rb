class Admin::EntriesController < ApplicationController
  before_filter :require_authentication
  
  respond_to :html, :xml, :json
  
  def index
    @entries = entry.draft.by_params(params).paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    render :template => 'entries/index'
  end
  
  private
  def entry
    Entry
  end
end
