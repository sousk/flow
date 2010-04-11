class Entry < ActiveRecord::Base
  
  # will-paginate
  cattr_reader :per_page
  @@per_page = 2
  
  scope :recent, order('created_at DESC')  
  scope :ranged, lambda {|opts|
    now = Time.now
    time = [opts[:year] || now.year, opts[:month] || now.month, now.day].join('-').to_time
    period = opts[:month] ? :month : :year
    
    where("created_at >= ? AND created_at <= ?", 
        time.send("beginning_of_#{period}").to_s(:db), time.send("end_of_#{period}").to_s(:db))
  }
  
  class << self
  end
  
  def posted
    created_at("")
  end
  
  def html
    body
  end
end
