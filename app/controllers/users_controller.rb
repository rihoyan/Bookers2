class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @book_new = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
       render :edit
    else
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
       redirect_to user_path(current_user.id), success: "You have updated user successfully."
    else
       render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
