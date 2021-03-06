class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :username, uniqueness: true
end
