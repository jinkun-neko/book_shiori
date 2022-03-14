Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/show' , to: 'pages#show'
  get '/books/new' , to: 'books#new'
  get '/books/show' , to: 'books#show'
  get '/books/edit' , to: 'books#edit'
  get '/books/index' , to: 'books#index'

devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: "users/registrations",
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
