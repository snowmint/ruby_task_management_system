Rails.application.routes.draw do

  namespace :admin, path: 'implicit' do
    get 'sessions/new'
    # resources :tasks
    root 'tasks#index'
    get 'tasks/new'
    post '/tasks/new' => 'tasks#create', as: 'new_task'
    get 'tasks/:id' => 'tasks#edit', as: 'edit_task'
    patch '/tasks/:id' => 'tasks#update'
    delete '/tasks/:id' => 'tasks#destroy'
    get 'tasks/home' => 'tasks#home', as: 'home_task'
    get 'tasks/:id/show' => 'tasks#show', as: 'show_task'
    #resources :users
    get 'users/new'
    get 'users/index' => 'users#index', as: 'list_user'
    post '/users/new' => 'users#create', as: 'new_user'
    get 'users/:id' => 'users#edit', as: 'edit_user'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
  end

  get 'sessions/new'
  # resources :tasks
  root 'tasks#index'
  get 'tasks/new'
  post '/tasks/new' => 'tasks#create', as: 'new_task'
  get 'tasks/:id' => 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id' => 'tasks#update'
  delete '/tasks/:id' => 'tasks#destroy'
  get 'tasks/home' => 'tasks#home', as: 'home_task'
  get 'tasks/:id/show' => 'tasks#show', as: 'show_task'
  #resources :users
  get 'users/new'
  get 'users/index' => 'users#index', as: 'list_user'
  post '/users/new' => 'users#create', as: 'new_user'
  get 'users/:id' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
