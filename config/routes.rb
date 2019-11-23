Rails.application.routes.draw do
  resources :data_loggers do
    resources :series
  end
  resources :users
  get '/signup', to: 'users#new'
end
