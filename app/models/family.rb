class Family < ActiveRecord::Base
  has_many :members
  has_secure_password
end
