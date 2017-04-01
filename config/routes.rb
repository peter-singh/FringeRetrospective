Rails.application.routes.draw do
  resources :favourites
  mount Commontator::Engine => '/commontator'
  resources :venues
  resources :votes
  resources :reviews
  resources :searches
  resources :performances
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post 'search' => 'search#do_search'
  # get 'search' => 'search#index'
  root 'home#welcome'

  get '/events/:id/is_favourited' => 'events#is_favourited'
  # get '/admin_panel'

  resources :search
  devise_for :users, controllers: { sessions: 'users/sessions' }


end
