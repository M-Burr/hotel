#require 'pry'
module Hotel
  class Hotel
    attr_reader :all_rooms, :all_reservations
    
    # @all_rooms to list all of the rooms inside the hotel
    # @all reservations keeps track of all reservations
    def initialize(num_of_rooms)
      @all_reservations = []
      @all_rooms = [] 
      num_of_rooms.times do |i|
        @all_rooms << "room 1 id: #{1}"
      end
    end
    
    def find_by_date(date)
      date = Date.parse(date)
      @all_reservations.find_all{|reservation| reservation.date_range.include?(date)}
    end
    
    # lists available rooms given a date range
    def check_availability(start_date, end_date)
      desired_dates = DateRange.new(start_date, end_date).reservation_range
      
      rooms = []
      rooms_and_reservations.each do |room, calendar|
        room_num = room if room_available?(calendar, desired_dates) 
        rooms << room_num 
      end
      return rooms.compact
    end
    
    def make_reservation(room_id, start_date, end_date)
      date_range = (DateRange.new(start_date, end_date)).reservation_range
      calendar = rooms_and_reservations[room_id]
      
      unless room_available?(calendar, date_range)
        raise ArgumentError
      end
      
      new_reservation = Reservation.new(room_id, start_date, end_date)
      @all_reservations.push(new_reservation)
    end
    
    private 
    
    def rooms_and_reservations
      rooms_and_reservations = {}
      num_rooms = @all_rooms.length
      num_rooms.times do |i|
        rooms_and_reservations[i + 1] = []
      end
      
      @all_reservations.each do |reservation|
        rooms_and_reservations[reservation.room_id].push(reservation)
      end      
      
      return rooms_and_reservations
    end
    
    def room_available?(calendar, desired_dates)
      room_available = true
      calendar.each do |booked_reservations|
        # Case 1.
        if desired_dates.end <= booked_reservations.date_range.begin
          # available
          room_available = room_available && true
          # Case 2.
        elsif desired_dates.begin < booked_reservations.date_range.begin && desired_dates.end < booked_reservations.date_range.end
          # Unavailable
          room_available = room_available && false
          # Case 3.
        elsif desired_dates.begin >= booked_reservations.date_range.begin && desired_dates.begin < booked_reservations.date_range.end && desired_dates.end < booked_reservations.date_range.end
          # Unavailable
          room_available = room_available && false
          # Case 4.
        elsif desired_dates.begin >= booked_reservations.date_range.begin && desired_dates.begin < booked_reservations.date_range.end && desired_dates.end >= booked_reservations.date_range.end
          # Unavailable
          room_available = room_available && false 
          # Case 5.
        elsif desired_dates.begin >= booked_reservations.date_range.end
          # available
          room_available = room_available && true
        else 
          room_available = room_available && false
        end
      end
      return room_available
    end
    
  end
end