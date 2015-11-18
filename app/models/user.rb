class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates_confirmation_of :password

  has_secure_password
end
