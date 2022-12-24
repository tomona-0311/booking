Rails.application.routes.draw do
  devise_for :users
  get 'rooms/new'
  resources :rooms do
    collection do
      get 'serch'
    end
  end
  get 'rooms/home'
  get 'reservations/index'
  get 'users/account'
  get 'users/profile'


  get 'rooms/index'
  get 'rooms/show'
  resources :users
  resources :rooms
  resources :reservations
  resources :rooms do
    resources :reservations
  end



  get 'pages/home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
