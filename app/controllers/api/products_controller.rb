class Api::ProductsController < ApplicationController
  def martin_guitar_action
    @martin = Product.first
    render "martin_guitar_action.json.jb"
  end
end
