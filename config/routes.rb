Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  

  resources :users, only: [:index] do
    collection do
      get "logout", to: "users#logout"
      get "card", to: "users#card" 
      get "card_add", to: "users#card_add" 
    end
  end

  resources :products, only: [:new, :index, :show] do
    collection do
      get "buy"
    end
  end
  
end
