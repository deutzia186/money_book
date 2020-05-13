class BooksController < ApplicationController
  def index
    # 収入計算
    @income =Book.where(user_id: current_user.id).where(select: "収入").where(date: Time.current.all_month)

		@income_total = 0
		@income.each do |income|
      @income_total += income.price
    end
    # 支出計算
    @expense =Book.where(user_id: current_user.id).where(select: "支出").where(date: Time.current.all_month)
    @expense_total = 0
    @expense.each do |expense|
      @expense_total += expense.price
    end
    # 収支計算
    @sum = @income_total - @expense_total

    @chart = Book.group(:category_id).count
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to new_book_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to new_book_path
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to lists_path
  end


  private

  def book_params
    params.require(:book).permit(:select, :date, :category_id, :price, :image, :image_cache, :memo,).merge(user_id: current_user.id)
  end
end
