class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      calculated_subtotal: 0,
      calculated_tax: 0,
      calculated_total: 0,
carted_product.each do
end
end
    )
    if @carted_product.save
      render "show.json.jb"
    else
      render json: { message: @carted_product.errors.full_messages }
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end
end
