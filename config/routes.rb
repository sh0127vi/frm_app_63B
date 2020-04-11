Rails.application.routes.draw do

  root to: "products#index_Top_page"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end  

  resources :users, only: :index do
    collection do
      get "logout", to: "users#logout"
    end
  end

  resources :products do
    resources :likes, only: [:create, :destroy, :show]
    resource :comments, only: :create
    collection do
      get "index_Top_page"
      get "index_all"
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end

    resource :purchases do
      member do
        get  "buy"
        post "pay"
      end
    end
  end

  resources :credit_cards, only: [:new, :show, :create, :index, :destroy] do
  end

end
