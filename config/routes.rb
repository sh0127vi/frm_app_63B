Rails.application.routes.draw do
  root 'top_page#index'
  devise_for :users

  resources :products, only: :new
  
  devise_scope :user do
    get "users", to: "users#index"
    get "users/logout", to: "users#logout"
    get "users/card", to: "users#card" 
    get "users/users/card_add", to: "users#card_add" 
  end
  root to: "products#index"
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :index]
  resources :users
end
