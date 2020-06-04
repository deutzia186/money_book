class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(book_id: params[:book_id])
    bookmark.save
    redirect_to lists_path
  end

  def destroy
    bookmark = Bookmark.find_by(book_id: params[:book_id], user_id: current_user.id)
    bookmark.destroy
    redirect_to lists_path
  end
end
