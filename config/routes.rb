Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/show'
  devise_for :users
  root to: "videos#index"
  resources :videos
  resources :categories
  resources :landing, only: [:index, :show]
  root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
