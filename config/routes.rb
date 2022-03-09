Rails.application.routes.draw do
  root 'pages#index'
  get '/new' , to: 'books#new'
  get '/show' , to: 'books#show'
  get '/edit' , to: 'books#edit'
  get 'pages/show' , to: 'pages#show'

devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: "users/registrations",
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
