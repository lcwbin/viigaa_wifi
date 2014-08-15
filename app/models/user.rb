class User < ActiveRecord::Base
  validates :password_digest, length: { minimum: 6 }
  VALID_ACCOUNT_REGEX = /1[358]\d{8}/
  validates :username, presence: true, format: { with: VALID_ACCOUNT_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
end
