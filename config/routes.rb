Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users 
  resources :questions do |q|
  	resources :votes
  end
  get "init", to: 'questions#init'
  get "random", to: 'visitors#random'
end
