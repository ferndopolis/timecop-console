DummyApp::Application.routes.draw do
  mount TimecopConsole::Engine => '/timecop_console'
  root 'sample#index'
end
