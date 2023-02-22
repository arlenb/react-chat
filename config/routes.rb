Rails.application.routes.draw do
  # action cable server
  mount ActionCable.server => '/cable'

  resources :messages

  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  get 'static_pages/home'
  root "static_pages#home"

  get '/messages', to: 'messages#index'
  post '/messages', to: 'messages#create'
  get '/messages/:id', to: 'messages#show'

  post "/new_message", to: "messages#submit"
  get "/new_message", to: "messages#new"


  post "/user", to: "user#submit_user"
  get "/signup", to: "user#new"

  get "/healthcheck", to: "healthcheck#index"
end
