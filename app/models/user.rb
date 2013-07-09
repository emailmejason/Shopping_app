class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :password, :username, :password_confirmation

  has_many :reviews
  has_many :items

  validates :username, :uniqueness => true
end
