Rails.application.routes.draw do
  get 'registrations/after_sign_up_path_for'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :events, only: [:index, :show] do
    resources :available_photographers, only: [:create]
    resources :packages, only: [:index, :show]
    resources :bookings, only: [:create]
  end
  resources :photographers, except: [:index, :show]
  resources :attendees, except: [:index, :show]
  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
