class ReviewsController < ApplicationController
  def create
# byebug

    @product = Product.find(params[:product_id])
    @review = Review.new review_params
    @review.product = @product
    #byebug
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      @reviews = @product.reviews.order(created_at: :desc)
      render "products/show"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@review.product)
  end
end

private 

def review_params 
    params.require(:review).permit(:rating, :body)
end