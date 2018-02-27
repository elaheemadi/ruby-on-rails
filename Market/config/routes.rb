Rails.application.routes.draw do

  get 'contact/index'

  get 'about/index'

  get 'sessions/new'

  get 'pages/index'
  get 'profile', to: 'pages#show'
  get 'login', to:  'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
   root 'pages#index'
   get '/cart', to: 'cart#index', as: 'cart'
  post '/checkout', to: 'cart#checkout', as: 'checkout'
  
  #controller
  resource :products

  #model
  resource :product
  get ':controller/(:action)/(:id)'
end
