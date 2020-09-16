class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = Order.all
      render "index.json.jb"
    else
      render json: { error: "must login to view orders" }
    end
  end

  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      calculated_subtotal = product.price * params[:quantity].to_i
      calculated_tax = calculated_subtotal * 0.09
      calculated_total = calculated_subtotal + calculated_tax
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )
      if @order.save
        render "create.json.jb"
      else
        render json: { error: @order.errors.full_messages }
      end
    else
      render json: {
        error: "login to place an order!",
      }
    end
  end
end
