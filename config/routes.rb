Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  

  resources :users, only: [:index, :logout, :card, :card_add] do
    collection do
    get "index", to: "users#index"
    get "logout", to: "users#logout"
    get "card", to: "users#card" 
    get "card_add", to: "users#card_add" 
    end
  end

  resources :products, only: [:new, :index, :show, ] do
    collection do
      get "buy"
    end
  end
  
end
