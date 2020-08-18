class UsersController < ApplicationController
  before_action :check_guest, only: :update

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @bookmark_books = @user.bookmark_books.order(date: :DESC, updated_at: :DESC).page(params[:page]).per(10)
    if @user == current_user
      render "show"
    else
      redirect_to root_path, alert: '閲覧できません'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def check_guest
    @guest = User.find(params[:id])
    if @guest.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは変更できません。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end