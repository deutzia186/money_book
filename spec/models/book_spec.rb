require 'rails_helper'

RSpec.describe Book, type: :model do
  it "dateがなければ無効であることを確認" do
    book = Book.new(date:"", category_id:"1", price:"1000")
    book.valid?
    expect(book.errors[:date]).to include("を入力してください")
  end
  
  it "category_idがなければ無効であることを確認" do
    book = Book.new(date:"2020-05-31 15:00:00", category_id:"", price:"1000")
    book.valid?
    expect(book.errors[:category_id]).to include("を入力してください")
  end

  it "priceがなければ無効であることを確認" do
    book = Book.new(date:"2020-05-31 15:00:00", category_id:"1", price:"")
    book.valid?
    expect(book.errors[:price]).to include("を入力してください")
  end

  it 'memo,imageがなくても有効であることを確認' do
    book = Book.new(date:"2020-05-31 15:00:00", category_id:"1", price:"1000", memo:"", image:"", user_id:"1")
    expect(book).to be_valid
  end
end
