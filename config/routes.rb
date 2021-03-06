Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :entities
  resources :transactions
  resources :transaction_type
  resources :transac_categs
  resources :payee_customers
  resources :payee_customer_types, only: [:index, :new, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

  resources :users

  resources :charts, only: [:index]

  root :to => 'welcome#index'

end
