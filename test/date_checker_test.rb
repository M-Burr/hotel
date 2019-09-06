require_relative 'test_helper'

describe "DateChecker Class" do 
  describe "DateChecker Instantiation" do 
    before do
      @date_range = Hotel::DateChecker.new("October 9, 2019", "October 10, 2019") 
    end
    
    it "must be an instance of DateChecker" do 
      expect(@date_range).must_be_kind_of Hotel::DateChecker
    end
    
    it "contains Date class objects" do 
      expect(@date_range.reservation_range.all?{ |date| date.class == Date }).must_equal true
    end
    
    it "throws an error for start and end dates" do 
      expect{Hotel::DateChecker.new("August 25, 2019", "August 14, 2019")}.must_raise ArgumentError
    end 
  end
  
  # describe "DateChecker returns a range" do 
  #   before do 
  #     @date_range = Hotel::DateChecker.new("September 9, 2020", "September 15, 2020")
  #   end 
  #   expect(@date_range.length).must_equal 7
  # end
  
end