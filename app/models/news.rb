class News < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  validates :image_url, file_content_type: { allow: ['image/jpeg', 'image/png'] }
end
