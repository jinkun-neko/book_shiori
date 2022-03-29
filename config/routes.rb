Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/show' , to: 'pages#show'
  post '/books/new' , to: 'books#create'
  post '/books/:id' , to: 'pages#create'
  resources :books
  resources :diaries

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: "users/confirmations"
  }
end