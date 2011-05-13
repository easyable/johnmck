Johnmck::Application.routes.draw do
  root :to => 'sites#index'
  resources :articles do
    resources :comments
  end
  
  resources :users
  resource :session
  
  match '/contact_path',   :to => 'sites#contact'
  match '/about_path',     :to => 'sites#about'
  match '/services_path',  :to => 'sites#services'
  match '/home_path',      :to => 'sites#index'
  match '/marketing_path', :to => 'sites#marketing'
  
  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"
end