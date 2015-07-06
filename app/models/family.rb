class Family < ActiveRecord::Base
  has_many :members
  validates_presence_of :username, :password_digest
  has_secure_password
end
