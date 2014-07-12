Rails.application.routes.draw do
  root to: 'emails#index'

  resource :account
  resources :emails

  namespace :api do
    resources :emails, only: [:show]
  end
end
