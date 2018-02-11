Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :transaction_type

  resource :session, only: [:new, :create, :destroy]

  resources :users

  root :to => 'welcome#index'

end
