require 'rails'
require 'timecop'
require 'timecop_console'

module TimecopConsole
  class Engine < Rails::Engine
    isolate_namespace TimecopConsole
    config.to_prepare do
      ApplicationController.helper(MainHelper)
    end
  end
end
