Rails.application.routes.draw do

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'

  delete '/logout', to: 'sessions#destroy', as: :logout

  resources :tweets, only: [:create, :index]

  resources :articles, only: [:index, :new, :create, :edit, :update]

  root to: 'articles#index'

  get 'contact', to: 'pages#contact'
end
