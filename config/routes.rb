Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "products/" => "products#create"

  get "products/:id" => "products#show"

  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products/" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#delete"

    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"

    post "/carted_products/" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
  end
end
