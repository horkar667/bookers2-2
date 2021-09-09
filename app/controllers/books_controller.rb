class BooksController < ApplicationController
  before_action :require_login
  before_action :ensure_current_user, {only: [:edit]}

  def index
    if params[:content]
      @books = Book.where(category: params[:content])
      @user = current_user
      @book = Book.new
    else
      @user = current_user
      @books = Book.order(params[:sort])
      @book = Book.new
    end
  end

  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
    @comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), flash:{success: "You have updated user successfully."}
    else
      render "books/edit"
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),flash:{success: "You have created book successfully."}
    else
      @user = current_user
      @books = Book.all
      render "books/index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.require(:book).permit(:title,:body,:user_id,:rate,:category)
  end

  def ensure_current_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
     redirect_to books_path
    end
  end
end
