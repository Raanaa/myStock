Rails.application.routes.draw do

  devise_for :users
  root 'assets#index'
  resources :assets

  post '/' , to: 'assets#create'
  get '/my_assets' , to: 'assets#my_assets'
  get '/invest' , to: 'assets#invest'
  get '/show' , to: 'assets#show'
  get '/update' , to: 'assets#update'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
