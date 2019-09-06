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
      @hotel = Hotel::Hotel.new(5)
      @hotel.make_reservation("October 5, 2019", "October 10, 2019")
      @hotel.make_reservation("October 12, 2019", "October 15, 2019")
      @hotel.make_reservation("December 1, 2020", "December 25, 2020")
    end
    
    it "updates total reservations for the hotel" do 
      expect(@hotel.all_reservations.length).must_equal 3
    end
    
    it "adds reservations objects to all_reservations" do 
      expect(@hotel.all_reservations.all?{ |reservation| reservation.class == Hotel::Reservation }).must_equal true
    end
  end
  
  describe "Hotel searches for reservations by date and date range" do 
    before do 
      @hotel = Hotel::Hotel.new(3)
      @hotel.make_reservation("October 5, 2019", "October 10, 2019")
      @hotel.make_reservation("October 12, 2019", "October 15, 2019")
      @hotel.make_reservation("December 1, 2020", "December 25, 2020")
    end
    
    it "looks up reservations by date" do 
      result = @hotel.find_by_date("October 5, 2019")
      expect(result).must_be_kind_of Array
      expect(result.all?{ |reservation| reservation.class == Hotel::Reservation }).must_equal true
      # make sure to exclude checkout date from list
    end
    
    it "looks up resverations by date range" do 
      expect(@hotel.check_availability("May 3, 2021", "May 5, 2021")).must_equal true # no overlap
      expect(@hotel.check_availability("October 10, 2019", "October 15, 2019")).must_equal true #for edge case like check out on check in day
      expect(@hotel.check_availability("December 3, 2020", "December 5, 2019")).must_equal false # for overlap case 
    end
    
  end
  
end