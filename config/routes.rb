Rails.application.routes.draw do
  #get 'list/index'
  # resources :list
  # resources :tasks
  root 'tasks#index'
  get 'tasks/new'
  post '/tasks/new' => 'tasks#create', as: 'new_task'
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id/edit' => 'tasks#update'
  delete '/tasks/:id/edit' => 'tasks#destroy'
  # root 'list#index'
  # get 'list/new'
  # post '/list/new' => 'list#create'
  # get 'list/:id/edit' => 'list#edit', as: 'list_edit'
  # patch '/list/:id/edit' => 'list#update'
  # delete '/list/:id' => 'list#destroy'
  #resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
