Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  devise_scope :user do
    get "users", to: "users#index"
    get "users/logout", to: "users#logout"
    get "users/card", to: "users#card" 
    get "users/card_add", to: "users#card_add" 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :index]
  resources :users
  
  resources :products, only: [:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
