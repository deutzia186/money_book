class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  belongs_to_active_hash :category
end