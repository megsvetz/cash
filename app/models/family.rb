class Family < ActiveRecord::Base
  has_many :members
  has_many :receipts
end
