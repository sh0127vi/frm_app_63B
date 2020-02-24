Rails.application.routes.draw do
  root to: "products#new"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kari, only: :index
  resources :products, only: :new
  resources :users
  root 'top_page#index'
  get 'users/index'
  root 'users#index'
end
  root to: "users#index"
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/users/card_add' => 'users#card_add'


end
