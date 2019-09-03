Rails.application.routes.draw do
  get 'purchase/new'
  get 'purchase/edit'
  get 'purchase/index'
  get 'purchase/show'
  devise_for :users
  root to: 'pages#home'
  resources :travels do
    resources :bookings
  end

  resources :purchases do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
