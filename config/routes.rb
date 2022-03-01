Rails.application.routes.draw do
  root 'books#index'
  get '/new' , to: 'books#new'
  get '/show' , to: 'books#show'
  get '/edit' , to: 'books#edit'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
