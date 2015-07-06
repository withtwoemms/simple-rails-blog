class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]\.[a-z]+\z/i # NEEDS FIXING -- currently allows person@email..com
  validates :email, presence: true, length: { maximum: 225 }, format: { with: VALID_EMAIL_REGEX }
  validates :user_name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
end
