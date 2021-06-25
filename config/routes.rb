Rails.application.routes.draw do

  root to: "videos#index"
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :videos do 
    resources :comments 
  end
  resources :users, only: [:index, :show]
  resources :categories
  resources :landing, only: [:index, :show]
  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
