Rails.application.routes.draw do
  get "/sessions/new", to: "sessions#new"
  post "/sessions/new", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  get "/pictures/new", to: "pictures#new"
  post "/pictures/new", to: "pictures#create"

  get "/oauth/new", to: "oauth#new"
  get "/oauth/callback", to: "oauth#callback"

  post "/tweets", to: "tweets#create"

  root "pictures#index"
end
