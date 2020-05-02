class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @users = User.all.order(first_name: :asc)
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def destroy
    id = params[:id]
    @user = User.find(id)
    @user.destroy
    redirect_to users_path
  end

  def update
    id = params[:id]
    @user = User.find(id)
    if @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
end
