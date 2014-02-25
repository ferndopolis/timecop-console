require 'spec_helper'

describe TimecopConsole::MainHelper do
  describe "#time_travel_to" do
    context "when a Date object is passed" do
      let(:date) { Date.parse('Dec 12, 1950') }

      it 'should return a link with timecop console route' do
        helper.time_travel_to(date).should == "<a data-method=\"post\" href=\"/timecop_console/update?timecop%5Bcurrent_time%281i%29%5D=1950&amp;timecop%5Bcurrent_time%282i%29%5D=12&amp;timecop%5Bcurrent_time%283i%29%5D=12&amp;timecop%5Bcurrent_time%284i%29%5D=12&amp;timecop%5Bcurrent_time%285i%29%5D=0\" rel=\"nofollow\">December 12, 1950</a>"
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
