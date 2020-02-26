Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: :new
  
  root 'top_page#index'
  get 'users' => 'users#index'
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/users/card_add' => 'users#card_add'


end
