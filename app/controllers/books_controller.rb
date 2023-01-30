class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:booknew] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:danger] = @book.errors.full_messages
      redirect_to books_path
      # @user = current_user
      # @books = Book.all
      # @newbook = Book.new
      # render :index
    end
    # @book.save
    # flash[:booknew] = "You have created book successfully."
    # redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all

    @newbook = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])

    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:bookedit] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    # @book.update(book_params)
    # flash[:bookedit] = "You have updated book successfully."
    # redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title ,:body)
  end
end
