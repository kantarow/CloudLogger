Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail", as: :user
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  resources :data_loggers do
    post '/add_data', to: "data_loggers#add_data"
    resources :series do
      resources :datum
    end
  end
  mount ActionCable.server => '/cable'
end
