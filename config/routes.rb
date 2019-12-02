Rails.application.routes.draw do
  resources :data_loggers do
    post '/add_data', to: "data_loggers#add_data"
    resources :series do
      resources :datum
    end
  end
  resources :users
  mount ActionCable.server => '/cable'
end
