Rails.application.routes.draw do
  root to: "products#index"
  #devise_for :users
  devise_scope :user do
    get "users", to: "users#index"
    get "users/logout", to: "users#logout"
    get "users/card", to: "users#card" 
    get "users/card_add", to: "users#card_add" 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :index]
  resources :users
end
