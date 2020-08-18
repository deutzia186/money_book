require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'date,price,user_id,category_idがあれば有効であること' do
    user = create(:user)
    category = create(:category)
    book = Book.new(date:"2020-05-31 15:00:00", price:"1000")
    book.user_id = user.id
    book.category_id = category.id
    expect(book).to be_valid
  end

  it "dateがなければ無効であること" do
    book = Book.new(date:nil, category_id:nil, price:"1000")
    book.valid?
    expect(book.errors[:date]).to include("を入力してください")
  end
  
  it "priceがなければ無効であること" do
    book = Book.new(date:"2020-05-31 15:00:00", category_id:"1", price:nil)
    book.valid?
    expect(book.errors[:price]).to include("を入力してください")
  end
end
