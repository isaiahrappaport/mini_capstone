class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount] == "true"
      @products = @products.where("price < 3000")
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.order(:price => :asc)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(:price => :desc)
    else
      @products = @products.order(:id => :asc)
    end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      # image: params["image"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )
    if @product.save
      render "create.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422 #:unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])

    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    # @product.image = params["image"] || @product.image
    @product.description = params["description"] || @product.description

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422 #:unprocessable_entity
    end
  end

  def delete
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "Product deleted successfully!" }
  end
end
