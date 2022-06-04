class Book < ApplicationRecord
  has_one_attached :cover_photos
  belongs_to :author
  validate :cover_photos_format
  
  private
  def cover_photos_format
  return unless cover_photos.attached?
     if cover_photos.blob.content_type.start_with? 'image/'
        if cover_photos.blob.byte_size >= 1.megabytes  
          errors.add(:cover_photos, 'size needs to be less than or equal to 1MB')
          cover_photos.purge
        elsif cover_photos.blob.content_type != 'image/png'
          errors.add(:cover_photos, ' needs to be in png format')
          cover_photos.purge
        end
    else
        cover_photos.purge
        errors.add(:cover_photos, 'needs to be an image')
    end
  end
end
