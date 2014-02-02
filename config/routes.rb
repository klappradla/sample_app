SampleApp::Application.routes.draw do
  resources :users
  # root
  root 'static_pages#home'
  
  # static_pages:
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  # user_pages
  match '/signup', to: 'users#new', via: 'get'
end
