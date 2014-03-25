require 'spec_helper'

describe TimecopConsole::MainHelper do
  describe "#time_travel_to" do
    context "when a Date object is passed" do
      let(:date) { Date.parse('Dec 12, 1950') }

      it 'should return a button with timecop console route' do
        helper.time_travel_to(date).should == "<form action=\"/timecop_console/update?timecop%5Bcurrent_time%281i%29%5D=1950&amp;timecop%5Bcurrent_time%282i%29%5D=12&amp;timecop%5Bcurrent_time%283i%29%5D=12&amp;timecop%5Bcurrent_time%284i%29%5D=12&amp;timecop%5Bcurrent_time%285i%29%5D=0\" class=\"button_to\" method=\"post\"><div><input type=\"submit\" value=\"December 12, 1950\" /></div></form>"
      end

      it 'should set the hour to default of 12' do
        helper.time_travel_to(date).should include("current_time%284i%29%5D=12")
      end

      context "when a custom name is passed" do
        let(:name) { "important_event" }
        it "should pass the name as the button name" do
          helper.time_travel_to(date, name).should include("value=\"important_event\"")
        end
      end
    end

    context "when a DateTime object is passed" do
      let(:date) { DateTime.parse('2001-02-03T04:05:06+07:00') }

      it "should set the hour accordingly" do
        helper.time_travel_to(date).should include("current_time%284i%29%5D=4")
      end
      it "should set the minute accordingly" do
        helper.time_travel_to(date).should include("current_time%285i%29%5D=5")
      end
    end

    context "when a string is passed" do
      let(:date) { "12-12-1950" }
      it "should raise an ArgumentError" do
        expect { helper.time_travel_to(date) }.to raise_error(ArgumentError, "Argument must be a Date object")
      end
    end
  end
end
