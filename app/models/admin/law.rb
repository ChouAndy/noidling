class Admin::Law < ActiveRecord::Base
  validates :name, presence: true
  validates :site_url, presence: true
  validates :word_url, presence: true
  validates :pdf_url, presence: true
end
