class Api::OrdersController < ApplicationController
  def create
    if current_user
      @order = Order.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity])
      render "create.json.jb"
    else
      render json: {
        error: "login to place an order!",
      }
    end
  end
end
