class ListsController < ApplicationController
  def index
    @categories = Category.all # 複数あるので変数名も複数系
    @book = current_user.books.order("date ASC") # userモデルにhas_many :booksとあるのでこう書ける
  end
end