Rails.application.routes.draw do
  get 'event/stripe_callback'
  get 'event/payment_profile'
  devise_for :users
  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    resources :travels do
      resources :bookings do
        resources :chat_rooms, only: [:show] do
          resources :messages, only: [:create]
        end
        resources :reviews, only: [:new, :create, :edit, :update]
      end
    end

    resources :purchases do
      resources :orders do
        resources :chat_rooms, only: [:show] do
          resources :messages, only: [:create]
        end
        resources :review_orders, only: [:new, :create, :edit, :update]
      end
    end

    get 'myprofile', to: 'pages#profil', as: 'profil'
    get 'myprofile/mypurchase', to: 'purchases#mypurchase', as: 'mypurchase'
    get 'myprofile/mytravel', to: 'travels#mytravel', as: 'mytravel'
    get 'myprofile/order', to: 'orders#display_resa', as: 'myorder'
    get 'myprofile/booking', to: 'bookings#display_resa', as: 'mybooking'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
