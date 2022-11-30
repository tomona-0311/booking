Rails.application.routes.draw do
  get 'reservations/index'
  get 'users/account'
  get 'users/profile'
  get 'rooms/new'
  get 'rooms/show'
  resources :users
  resources :rooms

  get 'pages/home'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
