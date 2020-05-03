class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true

  has_many :books
  has_many :bookmarks
  has_many :bookmark_books, through: :bookmarks, source: :book
end
