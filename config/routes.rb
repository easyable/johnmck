Johnmck::Application.routes.draw do
  root :to => 'sites#home'
  resources :articles do
    resources :comments
  end
  resources :comments
  resources :users
  resource :session
  
  match '/contact_path',   :to => 'sites#contact'
  match '/about_path',     :to => 'sites#about'
  match '/services_path',  :to => 'sites#services'
  match '/home_path',      :to => 'sites#home'
  match '/marketing_path', :to => 'sites#marketing'
  match '/approvals_path', :to => 'sites#approvals'
   
  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout" 
  match ':controller(/:action(/:id(.:format)))'
end
