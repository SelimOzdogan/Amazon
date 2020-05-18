class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:edit, :show]
  before_action :authorize!, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
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
    @products = Product.all.order(id: :desc)
    @favorite = Favorite.new
    # if can? :manage, @product
    # @reviews = @product.reviews.order(created_at: :desc)

  end

  def show
    if can? :hit, @product
      increase_hit
    end
    @review = Review.new
    # if can? :manage, @product
    @reviews = @product.reviews.order(created_at: :desc)
    # else
    # @reviews = @product.reviews.where(hidden: false).order(created_at: :desc)
    # end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def increase_hit
    if !current_user&.isadmin
      find_product
      @product.hit_count += 1
      @product.save
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def find_product
    @product = Product.find params[:id]
  end

  def authorize!
    redirect_to root_path, alert: "Access denied" unless can? :manage, @product
  end
end
