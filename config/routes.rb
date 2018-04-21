Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, controllers: {
  registrations: "registrations",
}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stockitems do
    resource :bids, only: [:new, :create, :index]
    # resource :orders, only: [:new, :create, :show]
  end
  resources :orders, except: [:destroy]
  resources :bids, only: :destroy
  resources :catalogitems, except: [:destroy]
  resources :orderstatuses, only: [:index]
  resources :users, only: [:show, :index]
end
