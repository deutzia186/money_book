class ListsController < ApplicationController
  def index
    @categories = Category.all
    @books = current_user.books.order("date ASC").page(params[:page]).per(5) # userモデルにhas_many :booksとあるのでこう書ける

    @q = Book.ransack(params[:q])
    @searches = @q.result(distinct: true)
  end

  def search
    @q = Book.ransack(search_params)
    @searches = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit(:date_gteq, :date_lteq, :memo_cont, :select_eq, :category_id_eq, :price_gteq, :price_lteq)
  end
end
