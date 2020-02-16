Rails.application.routes.draw do
  devise_for :users
  root "products#show"
  resources :products
end
