class UsersController < ApplicationController
  before_action :require_login
  before_action :ensure_current_user, {only: [:edit]}

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success]="You have updated user successfully."
    else
      render "users/edit"
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

      private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
     redirect_to user_path(current_user.id)
    end
  end
end
