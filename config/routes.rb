Rails.application.routes.draw do
  devise_for :users
  resources :products, only: :show
end
