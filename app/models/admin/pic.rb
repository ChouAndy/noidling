class Admin::Pic < ActiveRecord::Base
  belongs_to :activity, class_name: 'Admin::Activity', foreign_key: 'admin_activity_id'

  has_attached_file :pic, styles: { thumb: '200x200>' },
                             url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             hash_secret: '0b91ddfde655b7d05d4f5078a5606306c8301e2e16ddbde5fa0b13eeffef5bb86222b367d26e4b982f5c367413ea7909d3c154ed124da2ab2fa53a3afa1aeb61'
  validates_attachment :pic, content_type: { content_type: /\Aimage\/.*\Z/ },
                             size: { in: 0..5.megabytes }

  validates :pic, presence: true
end
