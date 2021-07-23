Rails.application.routes.draw do

  namespace :admin, path: 'implicit' do
    get 'sessions/new'
    
    resources :users do
      resources :tasks
    end
  end

  get 'sessions/new'
  get 'tasks/home' => 'tasks#home', as: 'home_task'
  root 'tasks#index'
  resources :tasks
  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
