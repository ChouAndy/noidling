class Admin::Counter < ActiveRecord::Base
  validates :number, presence: true
end
