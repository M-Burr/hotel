require_relative 'test_helper'

describe "DateRange Class" do 
  describe "DateRange Instantiation" do 
    before do
      @reservation_dates = Hotel::DateRange.new("October 9, 2019", "October 10, 2019") 
    end
    
    it "must be an instance of DateRange" do 
      expect(@reservation_dates).must_be_kind_of Hotel::DateRange
    end
    
    it "contains Date class objects" do 
      expect(@reservation_dates.reservation_range.all?{ |date| date.class == Date }).must_equal true
    end
    
    it "throws an error for start and end dates" do 
      expect{Hotel::DateRange.new("August 25, 2019", "August 14, 2019")}.must_raise ArgumentError
    end 
  end
end