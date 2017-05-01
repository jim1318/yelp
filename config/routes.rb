Rails.application.routes.draw do

  root        to: "businesses#index"
  get '/',    to: 'businesses#index'
  get 'home', to: 'businesses#index'

  #REGISTER & LOGIN
  get 'register', to: 'users#new'
  get 'sign_in',  to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  resources :users, only: [:create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reviews, only: [:index]
  resources :businesses, only: [:new, :create, :show, :index] do
    resources :reviews, only: [:new, :create]
  end

  #For UI Tests
  get 'ui(/:action)', controller: 'ui'
end
