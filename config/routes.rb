Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  devise_scope :user do
    get "users", to: "users#index"
    get "logout", to: "users#logout"
    get "card", to: "users#card" 
    get "card_add", to: "users#card_add" 
  end

  
  resources :products, only: [:new, :index, :show] do
    collection do
      get "buy"
    end
  end
  

  resources :users
end
