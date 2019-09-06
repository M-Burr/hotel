require_relative 'test_helper'

describe "Reservation class" do 
  describe "Reservation instantiation" do 
    before do 
      # start_date = Date.parse("September 1, 2019")
      # middle = Date.parse("September 2, 2019")
      # end_date = Date.parse("September 3, 2019")
      #date_range = [start_date, middle, end_date]      
      @autumn_trip = Hotel::Reservation.new(1, "September 1, 2019", "September 3, 2019")
    end
    
    it "is an instance of Reservation" do 
      expect(@autumn_trip).must_be_kind_of Hotel::Reservation
    end
    
    it "contains a reservation id" do 
      expect(@autumn_trip.reservation_id).must_be_kind_of Integer
      expect(@autumn_trip.reservation_id > 10_000).must_equal true
    end
    
    it "contains a room id" do 
      expect(@autumn_trip.room_id).must_be_kind_of Integer
      expect(@autumn_trip.room_id).must_equal 1
    end
    
    it "contains a date range" do 
      expect(@autumn_trip.date_range).must_be_kind_of Array
      expect(@autumn_trip.date_range[0]).must_equal(Date.parse("September 1, 2019"))
      expect(@autumn_trip.date_range[1]).must_equal(Date.parse("September 2, 2019"))
      expect(@autumn_trip.date_range[2]).must_equal(Date.parse("September 3, 2019"))
    end
    
    it "contains a cost" do 
      expect(@autumn_trip.cost).must_be_kind_of Integer
      expect(@autumn_trip.cost).must_equal 400
    end
    
  end
end