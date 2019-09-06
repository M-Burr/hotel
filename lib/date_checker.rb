require 'date'

module Hotel
  class DateChecker
    attr_reader :start_date, :end_date, :reservation_range
    
    def initialize (start_date, end_date)
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
      
      unless @start_date < @end_date
        raise ArgumentError
      end
      
      @reservation_range = []
      @reservation_range << @start_date
      current_date = @start_date
      
      until current_date == @end_date
        current_date = current_date.next
        @reservation_range << current_date
      end      
    end
  end
end