require_relative 'test_helper'

describe "Hotel class" do 
  describe "Hotel instantiation" do 
    before do 
      @hotel = Hotel::Hotel.new(5)
    end 
    
    it "is an instance of Hotel" do 
      expect(@hotel).must_be_kind_of Hotel::Hotel
    end
    
    it "lists all the hotel rooms & ids" do 
      expect(@hotel.all_rooms).must_be_kind_of Array
      expect(@hotel.all_rooms.length).must_equal 5
    end
    
    it "lists all reservations" do 
      expect(@hotel.all_reservations).must_be_kind_of Array
    end
  end
  
  describe "Hotel makes new reservations" do 
    before do 
      @hotel = Hotel::Hotel.new(1)
      @hotel.make_reservation(1, "October 5, 2019", "October 10, 2019")
      @hotel.make_reservation(1, "October 12, 2019", "October 15, 2019")
      @hotel.make_reservation(1, "December 1, 2020", "December 25, 2020")
    end
    
    it "updates total reservations for the hotel" do 
      expect(@hotel.all_reservations.length).must_equal 3
    end
    
    it "adds reservations objects to all_reservations" do 
      expect(@hotel.all_reservations.all?{ |reservation| reservation.class == Hotel::Reservation }).must_equal true
    end
    
    it "raises an error for no availability" do 
      expect{@hotel.make_reservation(1, "October 9, 2019", "October 10 2019")}.must_raise ArgumentError
    end
    
  end
  
  describe "Hotel searches for reservations by date and date range" do 
    before do 
      @hotel = Hotel::Hotel.new(1)
      @hotel.make_reservation(1, "October 5, 2019", "October 10, 2019")
      @hotel.make_reservation(1, "October 12, 2019", "October 15, 2019")
      @hotel.make_reservation(1, "November 15, 2019", "November 25, 2019")
      @hotel.make_reservation(1, "December 1, 2019", "December 25, 2019")
    end
    
    it "checks availability by date range" do 
      expect(@hotel.check_availability("August 12", "August 15")).must_equal [1]#available
      expect(@hotel.check_availability("May 3, 2021", "May 5, 2021")).must_equal [1] # available
      expect(@hotel.check_availability("December 25, 2019", "December 27, 2019")).must_equal [1] #for edge case like check out on check in day
      expect(@hotel.check_availability("December 3, 2019", "December 5, 2019")).must_equal [] # unavailable
      expect(@hotel.check_availability("September 30, 2019", "October 7, 2019")).must_equal [] # unavailable
      expect(@hotel.check_availability("October 5, 2019", "October 10, 2019")).must_equal [] # unavailable
      expect(@hotel.check_availability("October 5, 2019", "October 11, 2019")).must_equal [] # unavailable
      expect(@hotel.check_availability("November 30, 2019", "December 26. 2019")).must_equal [] # unavailable
    end
    
    it " returns a room number if available" do 
      @bigger_hotel = Hotel::Hotel.new(2)
      @bigger_hotel.make_reservation(1, "October 5, 2019", "October 10, 2019")
      @bigger_hotel.make_reservation(1, "November 1, 2019", "November 5, 2019")
      @bigger_hotel.make_reservation(2, "October 3, 2019", "October 15, 2019")
      
      expect(@bigger_hotel.check_availability("March 3, 2020", "March 7, 2020")).must_equal [1, 2]
      expect(@bigger_hotel.check_availability("November 4, 2019", "November 8, 2019")).must_equal [2] 
      expect(@bigger_hotel.check_availability("October 12, 2019", "October 17, 2019")).must_equal [1] 
      expect(@bigger_hotel.check_availability("October 14, 2019", "November 3, 2019")).must_equal []
    end
    
    
    
  end
end