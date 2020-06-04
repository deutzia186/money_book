class ListsController < ApplicationController
  def index
    @books = current_user.books.order(date: :DESC, updated_at: :DESC).page(params[:page]).per(10)

    @q = Book.ransack(params[:q])
    @searches = @q.result(distinct: true)
  end

  def search
    @q = Book.ransack(search_params)
    @searches = @q.result(distinct: true).where(user_id: current_user.id).order(date: :DESC, updated_at: :DESC).page(params[:page]).per(10)
  end

  private
  def search_params
    params.require(:q).permit(:date_gteq, :date_lteq, :memo_cont, :select_eq, :category_id_eq, :price_gteq, :price_lteq)
  end
end
