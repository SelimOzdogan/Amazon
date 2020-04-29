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
  end

  #increment hit_count

end
