Rails.application.routes.draw do
  get "/sessions/new", to: "sessions#new"
  post "/sessions/new", to: "sessions#create"
  get "/pictures/new", to: "pictures#new"
  post "/pictures/new", to: "pictures#create"
  root "pictures#index"
end
