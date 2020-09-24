class ProductsController < ApplicationController
  def index
    @products = Product.all
    @images = Image.all
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      supplier_id: 1,
      name: params[:name],
      price: params[:price],
      inventory: params[:inventory],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    redirect_to "/products"
  end
end
