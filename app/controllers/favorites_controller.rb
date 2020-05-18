class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user: current_user)
  end

  def create
    product = Product.find params[:product_id]
    favorite = Favorite.new user: current_user, product: product
    if product.user == current_user
      redirect_to products_path, alert: "can't add to Favorites your product"
    elsif favorite.save
      redirect_to products_path, notice: "Saved to Favorites"
    else
      redirect_to products_path, alert: "Not Added to Favorites"
    end
  end

  def destroy
    favorite = Favorite.find params[:id]
    if can? :destroy, favorite
      favorite.destroy
      redirect_to products_path, notice: "Favorite removed"
    else
      redirect_to products_path, alert: "can't remove Favorites"
    end
  end
end
