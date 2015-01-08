class Admin::Marquee < ActiveRecord::Base
  validates :text, presence: true
end
