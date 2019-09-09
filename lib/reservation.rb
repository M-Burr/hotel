require_relative 'hotel'

module Hotel 
  class Reservation
    
    @@last_id = 10_000
    attr_reader :reservation_id, :room_id, :date_range
    def initialize(room_id, start_date, end_date)
      @reservation_id = @@last_id + 1
      @@last_id = @reservation_id
      @room_id = room_id 
      @date_range = (DateRange.new(start_date, end_date)).reservation_range
      @cost = 0
    end
    
    def cost 
      reservation_cost = (@date_range.to_a.length - 1) * 200
      @cost = reservation_cost
    end
    
  end
end