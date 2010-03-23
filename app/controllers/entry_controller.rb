class EntryController < ApplicationController

  def index
    period = case
      when params[:dd] then 'date'
      when params[:mm] then 'month'
      when params[:yyyy] then 'year'
      else nil end
    pnum = params[:page] || 1
    
    @entries = if period
      time = time_of params
      Entry.list.between(
        time.send("beginning_of_#{period}"), time.send("end_of_#{period}")
      ).paginate :page=>pnum, :per_page=>Entry.per_page
    else
      Entry.list.paginate(:page => pnum, :per_page => Entry.per_page)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  def show
    raise Exception.new("hoge")
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
