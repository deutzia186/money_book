class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to new_book_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:book).permit(:select, :date, :category_id, :price, :image, :image_cache, :memo,).merge(user_id: current_user.id)
  end
end
