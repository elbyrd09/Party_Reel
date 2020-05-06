Rails.application.routes.draw do
  # get 'registrations/after_sign_up_path_for'
  devise_for :users, controllers: { registrations: "custom_registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :availablephotographers, only: [:destroy]
  resources :bookings, only: [:destroy]
  resources :events, only: [:index, :show] do
    resources :availablephotographers, only: [:create]
    resources :packages, only: [:index, :show]
    resources :bookings, only: [:create]
  end
  resources :photographers, except: [:index, :show]
  resources :attendees, except: [:index, :show]
  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:create]
    resources :payments, only: :new
  end

  get "edit_profile", to: "pages#edit_profile", as: :edit_profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
