Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
}
  resources :videos do 
    resources :comments 
  end
  resources :users, only: [:index, :show]
  resources :categories
  resources :landing, only: [:index, :show]
  resources :charges, only: [:new, :create]
  root to: "videos#index"
end
