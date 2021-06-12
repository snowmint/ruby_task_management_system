Rails.application.routes.draw do

  # resources :tasks
  root 'tasks#index'
  get 'tasks/new'
  post '/tasks/new' => 'tasks#create', as: 'new_task'
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id/edit' => 'tasks#update'
  delete '/tasks/:id/edit' => 'tasks#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
