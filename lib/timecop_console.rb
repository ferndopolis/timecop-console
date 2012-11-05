require 'timecop_console/engine'
require 'timecop_console/timecop_controller_methods'

module TimecopConsole
  SESSION_KEY_NAME = :timecop_adjusted_time unless defined?(SESSION_KEY_NAME)
end

ActionController::Base.send(:include, TimecopControllerMethods)
