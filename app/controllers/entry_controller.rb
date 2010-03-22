class EntryController < ApplicationController

  def index
    period = case
      when params[:dd] then :date
      when params[:mm] then :month
      when params[:yyyy] then :year
      else nil end
    
    @entries = if period
      time = time_of params
      Entry.list.between time.beginning_of_month, time.end_of_month
    else
      Entry.list
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  def show
  end
  
  private
  def time_of(params)
    now = Time.now
    [
      params[:yyyy] || now.year,
      params[:mm] || now.month,
      params[:dd] || now.day
    ].join('-').to_time
  end
end
