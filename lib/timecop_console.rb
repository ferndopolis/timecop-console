require 'timecop_console/engine'
require 'timecop_console/timecop_controller_methods'

ActionController::Base.send(:include, TimecopControllerMethods)
