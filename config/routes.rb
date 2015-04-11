Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do |u| 
    resources :votes
  end
  resources :questions
end
