class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates(:name, presence: true, length: { maximum: 50 })
  
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A([\w+\-.]+)@[a-z\d\-]+(\.[a-z\d\-])*(\.{1}[a-z]+)\z/i
  validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  
  has_secure_password #adds password, password_confirmation and authenticate method
  validates(:password, length: { minimum: 6 })
end
