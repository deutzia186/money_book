class ListsController < ApplicationController
  before_action :set_ransack

  def index
    @categories = Category.all
    @book = current_user.books.order("date ASC").page(params[:page]).per(5) # userモデルにhas_many :booksとあるのでこう書ける
  end

  private
  def set_ransack
    @q = Book.ransack(params[:q])
    @results = @q.result(distinct: true)
  end
end
