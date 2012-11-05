require 'timecop_console/engine'
require 'timecop_console/controller_methods'

module TimecopConsole
  SESSION_KEY_NAME = :timecop_adjusted_time unless defined?(SESSION_KEY_NAME)
end

ActionController::Base.send(:include, TimecopConsole::ControllerMethods)
