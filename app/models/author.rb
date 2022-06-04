class Author < ApplicationRecord
  has_one_attached :profile_picture
  has_many :books

  validate :profile_picture_format
  
  private
  def profile_picture_format
  return unless profile_picture.attached?
     if profile_picture.blob.content_type.start_with? 'image/'
        if profile_picture.blob.byte_size >= 1.megabytes  
          errors.add(:profile_picture, 'size needs to be less than or equal to 1MB')
          profile_picture.purge
        elsif profile_picture.blob.content_type != 'image/png'
          errors.add(:profile_picture, ' needs to be in png format')
          profile_picture.purge
        end
    else
        profile_picture.purge
        errors.add(:profile_picture, 'needs to be an image')
    end
  end
end
