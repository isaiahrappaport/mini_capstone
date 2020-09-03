class Api::ProductsController < ApplicationController
  def single_product_action
    @product = Product.find_by(id: params["product_id"])
    render "single_product_action.json.jb"
  end
end
