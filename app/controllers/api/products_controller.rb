class Api::ProductsController < ApplicationController
  def martin_guitar_action
    @martin = Product.first
    render "martin_guitar_action.json.jb"
  end
  def taylor_guitar_action
  @taylor = Product.second
  render "taylor_guitar.json.jb"
  end
end
