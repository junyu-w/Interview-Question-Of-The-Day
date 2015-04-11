Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/create'

  get 'questions/edit'

  get 'questions/update'

  get 'questions/destroy'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
