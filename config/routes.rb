Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  devise_scope :user do
    get "users", to: "users#index"
    get "logout", to: "users#logout"
    get "card", to: "users#card" 
    get "card_add", to: "users#card_add" 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :index] do
    collection do
      get "buy"
    end
  end
  

  resources :users
end
