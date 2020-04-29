class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :price))
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
  end

  def update
    id = params[:id]
    @product = Product.find(id)
    if @product.update(params.require(:product).permit(:title, :description, :price))
      redirect_to question_path(@product)
    else
      render :edit
    end
  end

  def index
    @products = Product.all.order("title ASC")
  end

  #increment hit_count

end
