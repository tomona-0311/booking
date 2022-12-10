Rails.application.routes.draw do
  devise_for :users
  get 'rooms/new'
  get 'reservations/index'
  get 'users/account'
  get 'users/profile'

  get 'rooms/index'
  get 'rooms/show'
  resources :users
  resources :rooms
  resources :rooms do
    resources :reservations
  end



  get 'pages/home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
