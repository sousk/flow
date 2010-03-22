# === Examples
#   datetime = DateTime.civil(2007, 12, 4, 0, 0, 0, 0)   # => Tue, 04 Dec 2007 00:00:00 +0000
# 
#   datetime.to_formatted_s(:db)            # => "2007-12-04 00:00:00"
#   datetime.to_s(:db)                      # => "2007-12-04 00:00:00"
#   datetime.to_s(:number)                  # => "20071204000000"
#   datetime.to_formatted_s(:short)         # => "04 Dec 00:00"
#   datetime.to_formatted_s(:long)          # => "December 04, 2007 00:00"
#   datetime.to_formatted_s(:long_ordinal)  # => "December 4th, 2007 00:00"
#   datetime.to_formatted_s(:rfc822)        # => "Tue, 04 Dec 2007 00:00:00 +0000"
#
# == Adding your own datetime formats to to_formatted_s
# DateTime formats are shared with Time. You can add your own to the
# Time::DATE_FORMATS hash. Use the format name as the hash key and
# either a strftime string or Proc instance that takes a time or
# datetime argument as the value.
#
#   # config/initializers/time_formats.rb
#   Time::DATE_FORMATS[:month_and_year] = "%B %Y"
#   Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }

Time::DATE_FORMATS[:entry] = "%d %b %Y"
# Time::DATE_FORMATS[:entry] = lambda { |t| t.strftime("#{t.day.ordinalize} %b %Y") }
