require 'rails'
require 'timecop'
require 'timecop_console'

module TimecopConsole
  class Engine < Rails::Engine
    isolate_namespace TimecopConsole
  end
end
