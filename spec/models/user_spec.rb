require 'rails_helper'

RSpec.describe User, type: :model do
  # it "nameがない場合は登録できないこと" do
  #   user = User.new(name: "", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000")
  #   user.valid?
  #   expect(user.errors[:name]).to include("can't be blank")
  # end
end
