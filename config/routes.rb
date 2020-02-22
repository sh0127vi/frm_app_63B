Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kari, only: :index
=======
  resources :users
>>>>>>> 9265cfcf23e8f9f6ede55028e3370a1cad576949
end
