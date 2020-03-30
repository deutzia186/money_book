class ListsController < ApplicationController
  def index
    @book = Book.where(user_id: current_user.id).order("created_at ASC")
  end
end
