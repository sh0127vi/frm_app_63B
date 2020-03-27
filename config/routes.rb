Rails.application.routes.draw do

  root to: "products#index_Top_page"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end  

  resources :users, only: [:index, :edit, :update] do
    collection do
      get "logout", to: "users#logout"
      get "card", to: "users#card" 
      get "card_add", to: "users#card_add" 
    end
  end

  resources :products do
    resources :likes, only: [:create, :destroy, :show]
    resource :comments, only: :create
    collection do
      get "buy"
      get "index_Top_page"
      get "index_all"
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end
  end

end
