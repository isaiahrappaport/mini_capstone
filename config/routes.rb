Rails.application.routes.draw do
  namespace :api do
    get "/martin_guitar" => "products#martin_guitar_action"
  end
end
