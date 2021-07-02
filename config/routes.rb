Rails.application.routes.draw do

  get 'sessions/new'
  # resources :tasks
  root 'tasks#index'
  get 'tasks/new'
  post '/tasks/new' => 'tasks#create', as: 'new_task'
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id/edit' => 'tasks#update'
  delete '/tasks/:id/edit' => 'tasks#destroy'
  get 'tasks/home' => 'tasks#home', as: 'home_task'
  #resources :users

  get 'users/new'
  post '/users/new' => 'users#create', as: 'new_user'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id/edit' => 'users#update'
  delete '/users/:id/edit' => 'users#destroy'
  get 'users/:id' => 'users#show', as: 'show_user'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
