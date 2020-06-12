require 'rails_helper'

RSpec.describe Book, type: :model do
  it "date,category,town,priceがそれぞれ空の場合無効です。" do
    book = Book.new(date:"", category:"食費", price:"1000")
    book.valid?
    expect(book.errors[:date).to include("can't be blank")
  end
end
