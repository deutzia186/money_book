class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:select, :date, :price, :image, :image_cache, :memo,).merge(user_id: current_user.id)
  end
end
