Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/create'

  get 'questions/edit'

  get 'questions/update'

  get 'questions/destroy'

  root to: 'visitors#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do |u| 
    resources :votes
  end
end
