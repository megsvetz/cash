class Member < ActiveRecord::Base
  belongs_to :family
  has_many :receipts 
  validates_presence_of :name

  def self.by_first_name
    order(:name)
  end

end
