class ReviewsController < ApplicationController
  #  before_action :authorize!, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    if can? :review, @product
      @review = Review.new review_params
      @review.product = @product
      @review.user_id = current_user.id

      if @review.save
        redirect_to product_path(params[:product_id])
      else
        @reviews = @product.reviews.order(created_at: :desc)
        redirect_to product_path(params[:product_id])
      end
    else
      flash[:warning] = "You can't add review for your product"
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    @review = Review.find params[:id]
    if can? :destroy, @review
      @review.destroy
      redirect_to product_path(@review.product)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  # def authorize!
  #   redirect_to root_path, alert: "Access denied" unless can? :manage, @review
  # end
end
