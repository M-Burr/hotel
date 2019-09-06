require_relative 'hotel'

module Hotel 
  class Reservation
    
    @@last_id = 10_000
    attr_reader :reservation_id, :room_id, :date_range, :cost 
    def initialize(room_id, start_date, end_date)
      @reservation_id = @@last_id + 1
      @@last_id = @reservation_id
      @room_id = room_id # Hotel manager should assign room id, figure out later
      @date_range = (DateRange.new(start_date, end_date)).reservation_range
      @cost = 0
    end
    
    # def available?(date)
    #   date = Date.parse(date)
    #   #check in reseervations array
    # end
    
    def cost 
      reservation_cost = (@date_range.to_a.length - 1) * 200
      @cost = reservation_cost
    end
    
    # def self.find_by(date)
    #   reservation_ids = []
    #   date = Date.parse(date)
    #   booked_reservations = @@all_reservations.find_all{ |reservation| reservation.date_range.include?(date)} 
    
    #   if booked_reservations.nil?
    #     return "We don't have reservations on that #{date}."
    #   else
    #     booked_reservations.each do |reservation| 
    #       reservation_ids << reservation.reservation_id
    #     end
    #   end
    #   return "The reservation on #{date} are: #{reservation_ids}"
    
    # end
    
  end
end