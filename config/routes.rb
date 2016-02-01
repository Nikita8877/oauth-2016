Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'

  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :tweets, only: [:create, :index]

  root to: 'pages#index'

  get 'contact', to: 'pages#contact'
end
