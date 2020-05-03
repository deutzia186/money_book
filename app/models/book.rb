class Book < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end