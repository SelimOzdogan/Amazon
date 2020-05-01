class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    # byebug
    @product = Product.new(params.require(:product).permit(:title, :description, :price))
    @product.user_id = current_user.id
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
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def index
    @products = Product.all.order("title ASC")
  end

  def show
    id = params[:id]
    @product = Product.find(id)
    
    @review = Review.new
    @reviews = @product.reviews.order(created_at: :desc)
end

def destroy
    id = params[:id]
    @product = Product.find(id)
    @product.destroy
    redirect_to products_path
  end

  #increment hit_count

end
