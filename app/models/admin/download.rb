class Admin::Download < ActiveRecord::Base
  has_attached_file :upload, styles: { medium: '300x300>', thumb: '100x100>' },
                             url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             hash_secret: '0b91ddfde655b7d05d4f5078a5606306c8301e2e16ddbde5fa0b13eeffef5bb86222b367d26e4b982f5c367413ea7909d3c154ed124da2ab2fa53a3afa1aeb61'
  validates_attachment :upload, size: { in: 0..5.megabytes },
                                file_type_ignorance: true

  validates :category, presence: true
  validates :title, presence: true
  validates :upload, presence: true, if: "download_type == 0"
  validates :url_file_size, presence: true, if: "download_type == 1"
  validates :url_file_size_unit, presence: true, if: "download_type == 1"
  validates :url, presence: true, if: "download_type == 1"

  before_post_process :resize_images

  def image?
    upload_content_type =~ /\Aimage\/.*\Z/
  end

  private

  def resize_images
    return false unless image?
  end
end
