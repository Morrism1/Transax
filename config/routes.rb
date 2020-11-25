Rails.application.routes.draw do
  resources :transactions
  resources :groups
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/external',   to: 'transactions#external_transactions'
  resources :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
