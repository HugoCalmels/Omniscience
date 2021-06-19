Rails.application.routes.draw do
  root to: "videos#index"
  
  devise_for :users
  
  resources :videos
  resources :categories
  resources :landing, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
