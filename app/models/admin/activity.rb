class Admin::Activity < ActiveRecord::Base
  has_many :pics, class_name: 'Admin::Pic', foreign_key: 'admin_activity_id', dependent: :destroy
  validates_presence_of :name, :subject, :sponsor, :hold_date, :start_time, :end_time, :site, :achievement
end
