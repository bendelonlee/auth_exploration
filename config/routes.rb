Rails.application.routes.draw do
  resources :secrets, only: [:index]
  resources :users, only: [:new, :index, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
