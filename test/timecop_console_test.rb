require 'test_helper'
require 'actionpack'
require 'action_controller'
# require 'action_controller/assertions/routing_assertions'

require "timecop-console/timecop_controller_methods"

# We need this defined for the session key
class ApplicationController < ActionController::Base
  
end

require 'timecop_console'
class SampleController < ActionController::Base
  
end

class TimecopConsoleTest < Test::Unit::TestCase
  
  should "add around_filter to SampleController" do
    assert SampleController.around_filter.any?{|filter| filter.around? && filter.method == :handle_timecop_offset}, "before_filter should have been applied"
  end
  
  # should "recognize the new routes" do
  #   assert_recognizes({:controller => 'timecop', :action => 'update'})
  #   assert_recognizes({:controller => 'timecop', :action => 'reset'})
  # end
  
end
