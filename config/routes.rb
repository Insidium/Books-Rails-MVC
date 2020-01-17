Rails.application.routes.draw do
  get "/", to: "books#index"
  post "/create", to: "books#create"
  get "/show/:id", to: "books#show"
  put "/update", to: "books#update"

end
