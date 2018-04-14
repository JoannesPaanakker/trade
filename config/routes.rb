Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stockitems do
    resource :bids, only: [:new, :create, :index]
    resource :orders, only: [:new, :create, :show]
  end
  resources :orders, only: [:index, :show]
end
