class ListsController < ApplicationController
  def index
    @categories = Category.all
    @book = current_user.books.order("date ASC") # userモデルにhas_many :booksとあるのでこう書ける
  end
end