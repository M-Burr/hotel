module Hotel
  class Hotel
    attr_reader :all_rooms, :all_reservations
    
    #call @all_rooms to list all of the rooms inside the hotel
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
      # should I do each instead & if date is last day of reservation, alert hotel that it
      # is checkout day
    end
    
    def check_availability(start_date, end_date)
      #checks @all reservations to make sure no overlap
      #organize rooms by reservations 
      #iterate through all rooms to find openings
      #return room numbers available for that date
      desired_dates = DateChecker.new(start_date, end_date).reservation_range
      rooms_and_reservations = {}
      
      #creates a new hash to use for this method only
      @all_reservations.each do |reservation|
        rooms_and_reservations["Room #{reservation.room_id}"] = reservation.date_range
      end
      
      # iterates over rooms & reservations to find if the desired dates conflict
      # if it conflicts, return error message
      # if it does not cinflict say it is available/return true
      
      rooms_and_reservations.each do |room, calendar|
        calendar.each do |reservations|
          
        end
      end
    end
    
    def make_reservation(start_date, end_date)
      date_range = (DateChecker.new(start_date, end_date)).reservation_range
      new_reservation = Reservation.new(1, start_date, end_date)
      @all_reservations.push(new_reservation)
      #call on check_availability helper method before confirming. only book if true
    end
    
    # def available?(start_date, end_date)
    #   #this will be a helper method to be used inside make_reservation
    #   #if it returns true, will allow new reservations
    #   start_date = Date.parse(start_date)
    #   end_date = Date.parse(end_date)
    #   date_range 
    # end
    
  end
end