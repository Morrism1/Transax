Rails.application.routes.draw do
  resources :transactions, only: %i[index create new]
  resources :groups, only: %i[index new create show]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/external', to: 'transactions#external_transactions'
  resources :users, only: %i[new create show]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
