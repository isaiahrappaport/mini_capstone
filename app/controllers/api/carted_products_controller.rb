class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )
    if @carted_product.save
      render "carted_products.json.jb"
    else
      render json: { message: @carted_product.errors.full_messages }
    end
  end

  def index
    @carted_products = current_user.carted_products
    render "index.json.jb"
  end
end
