
require 'timecop'
require 'timecop-console/timecop_controller_methods'
ActionController::Base.send(:include, TimecopControllerMethods)

require File.join(File.dirname(__FILE__), "timecop-console", "controllers", "timecop_controller")
require File.join(File.dirname(__FILE__), "timecop-console", "routes")
