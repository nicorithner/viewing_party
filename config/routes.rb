Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  post '/login', to: 'sessions#create'

  namespace :user do
    get '/dashboard', to: 'dashboard#index'
  end
end
