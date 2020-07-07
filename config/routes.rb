Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: %i[index new create show]
  
  get 'users/new'
  get 'users/create'
  get 'users/show'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
