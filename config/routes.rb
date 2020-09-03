Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#single_product_action"
  end
end
