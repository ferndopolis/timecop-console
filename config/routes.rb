TimecopConsole::Engine.routes.draw do
  match '/update' => 'main#update', :as => :update, :via => [:post, :put]
  match '/reset' => 'main#reset', :as => :reset, :via => [:get]
end
