class Admin::EntriesController < ApplicationController
  before_filter :require_authentication
  
  def index
    @entries = Entry.draft.paginate(
      :page => (params[:page] || 1), :per_page => Entry.per_page)
    
    render :template => 'entries/index'
  end

  def new
  end

  def edit
  end

end
