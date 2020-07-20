Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :event_attendees
  resources :events, only: %i[index create new show] do
    post 'attend', :user
  end
  resources :users, only: %i[show index]
  resources :invitations
end
