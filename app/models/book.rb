class Book < ApplicationRecord
  belongs_to :user
  has_many   :bookmarks
  belongs_to :category

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  mount_uploader :image, ImageUploader
end
