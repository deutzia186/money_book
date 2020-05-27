class BooksController < ApplicationController
  def index
    @month = Date.today.strftime('%-m月')
    @text = "の収支"
    @title = @month + @text

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
    
    # 円グラフ
    @expense_chart = Book.eager_load(:category).where(categories: {id: 1..15 }).where(user_id: current_user.id).where(date: Time.current.all_month).group('categories.name').order("SUM(books.price) DESC").pluck('categories.name, SUM(books.price)')
    @income_chart = Book.eager_load(:category).where(categories: {id: 16..23 }).where(user_id: current_user.id).where(date: Time.current.all_month).group('categories.name').order("SUM(books.price) DESC").pluck('categories.name, SUM(books.price)')

    #直近の明細
    @books = Book.where(user_id: current_user.id).order(date: :DESC, updated_at: :DESC).limit(5)

    # カレンダー
    @calendars = Book.all.where(user_id: current_user.id)

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to lists_path
    else
      redirect_to root_path, alert: '登録できませんでした'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to lists_path
  end

  def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to lists_path
  end

  private

  def book_params
    params.require(:book).permit(:select, :date, :category_id, :price, :image, :image_cache, :remove_image, :memo,).merge(user_id: current_user.id)
  end
end
