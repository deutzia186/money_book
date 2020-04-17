class ListsController < ApplicationController
  def index
    @category = Category.all
    @book = Book.where(user_id: current_user.id).order("date ASC")
  end
end
